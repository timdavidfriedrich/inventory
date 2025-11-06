import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';
import 'package:inventory/src/features/declutter/presentation/declutter_event.dart';
import 'package:inventory/src/features/declutter/presentation/declutter_state.dart';

@injectable
class DeclutterBloc extends Bloc<DeclutterEvent, DeclutterState> {
  final ItemRepository _itemRepository;

  DeclutterBloc(this._itemRepository) : super(const DeclutterInitial()) {
    on<DeclutterSubscriptionRequested>(_onSubscriptionRequested);
    on<DeclutterKeep>(_onKeep);
    on<DeclutterToss>(_onToss);
    on<DeclutterMove>(_onMove);
    on<DeclutterSkip>(_onSkip);
  }

  Future<void> _onSubscriptionRequested(
    DeclutterSubscriptionRequested event,
    Emitter<DeclutterState> emit,
  ) async {
    emit(const DeclutterLoading());

    await emit.forEach<AppResult<List<Item>>>(
      _itemRepository.watchItems(),
      onData: (result) {
        return switch (result) {
          Success(:var value) => DeclutterSuccess(items: value),
          Error(:var error) => DeclutterError(message: error.toString()),
        };
      },
      onError: (e, stackTrace) {
        return DeclutterError(message: e.toString());
      },
    );
  }

  Future<void> _onKeep(DeclutterKeep event, Emitter<DeclutterState> emit) async {
    // try/catch
    //await _itemRepository.keepItem(event.item);
  }

  Future<void> _onToss(DeclutterToss event, Emitter<DeclutterState> emit) async {
    //await _itemRepository.tossItem(event.item);
  }

  Future<void> _onMove(DeclutterMove event, Emitter<DeclutterState> emit) async {
    //await _itemRepository.moveItem(event.item);
  }

  Future<void> _onSkip(DeclutterSkip event, Emitter<DeclutterState> emit) async {
    //await _itemRepository.skipItem(event.item);
  }
}
