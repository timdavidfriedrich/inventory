import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session_config.dart';
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/create_session_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/delete_session_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/watch_active_sessions_use_case.dart';
import 'package:inventory/src/features/declutter/presentation/hub/hub_event.dart';
import 'package:inventory/src/features/declutter/presentation/hub/hub_state.dart';
import 'package:log/log.dart';

@injectable
class HubBloc extends Bloc<HubEvent, HubState> {
  final CreateSessionUseCase _createSessionUseCase;
  final DeleteSessionUseCase _deleteSessionUseCase;
  final WatchActiveSessionsUseCase _watchActiveSessionsUseCase;

  HubBloc(
    this._createSessionUseCase,
    this._deleteSessionUseCase,
    this._watchActiveSessionsUseCase,
  ) : super(const HubInitial()) {
    on<HubActiveSessionsRequested>(_onActiveSessionsRequested);
    on<HubNewQuickSessionRequested>(_onNewQuickSessionRequested);
    on<HubNewLocationSessionRequested>(_onNewLocationSessionRequested);
    on<HubNewTagSessionRequested>(_onNewTagSessionRequested);
    on<HubDeleteSession>(_onDeleteSession);
  }

  Future<void> _onActiveSessionsRequested(
    HubActiveSessionsRequested event,
    Emitter<HubState> emit,
  ) async {
    emit(const HubLoading());

    await emit.forEach<AppResult<List<DeclutterSession>>>(
      _watchActiveSessionsUseCase(),
      onData: (result) => switch (result) {
        Success(:var value) => HubLoadSuccess(value),
        Empty() => const HubLoadSuccess([]),
        Error(:var error) => HubError(error.toString()),
      },
      onError: (e, stackTrace) => HubError(e.toString()),
    );
  }

  Future<void> _onNewQuickSessionRequested(
    HubNewQuickSessionRequested event,
    Emitter<HubState> emit,
  ) async {
    final result = await _createSessionUseCase(
      config: QuickDeclutterSessionConfig(
        contextName: "Quick Check",
        maxItems: 10,
      ),
    );

    if (result is Success<int>) {
      final sessionId = result.value;
      emit(HubNavigationSuccess(sessionId));
      // Re-trigger active sessions loading
      add(const HubActiveSessionsRequested());
    } else if (result is Error) {
      Log.error("HubBloc: Failed to create new quick session", exception: (result as Error).error);
      emit(HubError((result as Error).error.toString()));
    }
  }

  Future<void> _onNewLocationSessionRequested(
    HubNewLocationSessionRequested event,
    Emitter<HubState> emit,
  ) async {
    final result = await _createSessionUseCase(
      config: DeclutterByLocationSessionConfig(
        locationId: event.locationId,
        // TODO: Fetch location name by id
        contextName: "Location Session",
      ),
    );

    if (result is Success<int>) {
      final sessionId = result.value;
      emit(HubNavigationSuccess(sessionId));
      // Re-trigger active sessions loading
      add(const HubActiveSessionsRequested());
    } else if (result is Error) {
      Log.error("HubBloc: Failed to create new location session",
          exception: (result as Error).error);
      emit(HubError((result as Error).error.toString()));
    }
  }

  Future<void> _onNewTagSessionRequested(
    HubNewTagSessionRequested event,
    Emitter<HubState> emit,
  ) async {
    final result = await _createSessionUseCase(
      config: DeclutterByTagSessionConfig(
        tag: event.tag,
        contextName: event.tag,
      ),
    );

    if (result is Success<int>) {
      final sessionId = result.value;
      emit(HubNavigationSuccess(sessionId));
      // Re-trigger active sessions loading
      add(const HubActiveSessionsRequested());
    } else if (result is Error) {
      Log.error("HubBloc: Failed to create new tag session", exception: (result as Error).error);
      emit(HubError((result as Error).error.toString()));
    }
  }

  Future<void> _onDeleteSession(
    HubDeleteSession event,
    Emitter<HubState> emit,
  ) async {
    final sessionId = event.sessionId;
    if (sessionId == null) {
      Log.error("HubBloc: Cannot delete session, sessionId is null");
      emit(const HubError("Session not found, cannot delete."));
      return;
    }
    await _deleteSessionUseCase(sessionId);
  }
}
