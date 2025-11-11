import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/delete_session_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/get_current_session_item_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/get_session_by_id_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/item/mark_to_keep_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/item/mark_to_move_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/item/mark_to_toss_use_case.dart';
import 'package:inventory/src/features/declutter/domain/usecases/declutter_session/update_session_use_case.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_event.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/swipe_state.dart';
import 'package:log/log.dart';

@injectable
class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final GetCurrentSessionItemUseCase _getCurrentItemUseCase;
  final GetSessionByIdUseCase _getSessionByIdUseCase;
  final DeleteSessionUseCase _deleteSessionUseCase;
  final UpdateSessionUseCase _updateSessionUseCase;
  final MarkToKeepUseCase _markToKeepUseCase;
  final MarkToMoveUseCase _markToMoveUseCase;
  final MarkToTossUseCase _markToTossUseCase;

  final int? sessionId;

  SwipeBloc(
    this._getCurrentItemUseCase,
    this._getSessionByIdUseCase,
    this._deleteSessionUseCase,
    this._updateSessionUseCase,
    this._markToKeepUseCase,
    this._markToMoveUseCase,
    this._markToTossUseCase, {
    @factoryParam required this.sessionId,
  }) : super(const SwipeInitial()) {
    on<SwipeCurrentItemRequested>(_onCurrentItemRequested);
    on<SwipeItemActioned>(_onItemActioned);
    on<SwipeDeleteSession>(_onDeleteSession);
  }

  Future<void> _onCurrentItemRequested(
    SwipeCurrentItemRequested event,
    Emitter<SwipeState> emit,
  ) async {
    emit(const SwipeLoading());

    final id = sessionId;
    if (id == null) {
      final message = "Session ID is null";
      Log.error("SwipeBloc: $message");
      emit(SwipeError(message));
      return;
    }

    final sessionResult = await _getSessionByIdUseCase(id);
    if (sessionResult is Error) {
      Log.error("SwipeBloc: Failed to load session", exception: (sessionResult as Error).error);
      emit(SwipeError((sessionResult as Error).error.toString()));
      return;
    }

    final session = (sessionResult as Success).value;
    if (session == null) {
      final message = "Session not found";
      Log.error("SwipeBloc: $message");
      emit(SwipeError(message));
      return;
    }

    if (session.progressIndex >= session.itemIds.length) {
      emit(const SwipeSessionFinished());
      return;
    }

    final itemResult = await _getCurrentItemUseCase(id);
    if (itemResult is Error) {
      Log.error("SwipeBloc: Failed to load current item", exception: (itemResult as Error).error);
      emit(SwipeError((itemResult as Error).error.toString()));
      return;
    }

    final item = (itemResult as Success).value;
    if (item == null) {
      emit(const SwipeSessionFinished());
      return;
    }

    emit(SwipeItemLoadSuccess(
      item: item,
      currentIndex: session.progressIndex,
      totalItems: session.itemIds.length,
    ));
  }

  Future<void> _onItemActioned(
    SwipeItemActioned event,
    Emitter<SwipeState> emit,
  ) async {
    final id = sessionId;
    if (id == null) {
      final message = "Session ID is null";
      Log.error("SwipeBloc: $message");
      emit(SwipeError(message));
      return;
    }
    if (state is! SwipeItemLoadSuccess) {
      final message = "No item loaded to action upon";
      Log.warning("SwipeBloc: $message");
      emit(SwipeError(message));
      return;
    }
    final successState = state as SwipeItemLoadSuccess;
    final result = switch (event.action) {
      SwipeAction.keep => await _markToKeepUseCase(successState.item),
      SwipeAction.toss => await _markToTossUseCase(successState.item),
      SwipeAction.move => await _markToMoveUseCase(successState.item),
    };

    if (result is Error) {
      Log.error("SwipeBloc: Failed to action item", exception: result.error);
      emit(SwipeError(result.error.toString()));
      return;
    }

    final sessionResult = await _getSessionByIdUseCase(id);
    if (sessionResult is Success) {
      final session = (sessionResult as Success).value as DeclutterSession?;
      if (session != null) {
        final updatedSession = session.copyWith(
          progressIndex: session.progressIndex + 1,
          updatedAt: DateTime.now(),
        );
        await _updateSessionUseCase(updatedSession).then((_) {
          add(const SwipeCurrentItemRequested());
        });
      }
    }
  }

  Future<void> _onDeleteSession(
    SwipeDeleteSession event,
    Emitter<SwipeState> emit,
  ) async {
    final id = sessionId;
    if (id == null) {
      Log.error("SwipeBloc: Cannot delete session, sessionId is null");
      emit(const SwipeError("Session not found, cannot delete."));
      return;
    }
    await _deleteSessionUseCase(id);
  }
}
