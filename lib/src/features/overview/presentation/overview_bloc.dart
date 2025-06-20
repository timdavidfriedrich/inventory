import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/usecases/item/delete_item_use_case.dart';
import 'package:inventory/src/core/domain/usecases/item/get_all_items_use_case.dart';
import 'package:inventory/src/features/overview/presentation/overview_event.dart';
import 'package:inventory/src/features/overview/presentation/overview_state.dart';

@injectable
class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final GetAllItemsUseCase _getAllItemsUseCase;
  final DeleteItemUseCase _deleteItemUseCase;

  OverviewBloc(
    this._getAllItemsUseCase,
    this._deleteItemUseCase,
  ) : super(OverviewLoading()) {
    on<OverviewRefreshItems>((event, emit) async {
      emit(OverviewLoading());
      if (event.result is Success) {
        emit(OverviewSuccess((event.result as Success).data));
      } else if (event.result is Error) {
        emit(OverviewError((event.result as Error).error.toString()));
      }
    });

    on<OverviewDeleteItem>((event, emit) async {
      emit(OverviewLoading());
      await _deleteItemUseCase(event.item);
    });

    _init();
  }

  void _init() {
    _getAllItemsUseCase().forEach((result) {
      add(OverviewRefreshItems(result));
    });
  }
}
