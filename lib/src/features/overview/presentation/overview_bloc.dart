import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/usecases/item/get_all_items_use_case.dart';
import 'package:inventory/src/core/domain/usecases/item/save_item_use_case.dart';
import 'package:inventory/src/features/overview/presentation/overview_event.dart';
import 'package:inventory/src/features/overview/presentation/overview_state.dart';

@injectable
class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final GetAllItemsUseCase _getAllItemsUseCase;
  final SaveItemUseCase _saveItemUseCase;

  OverviewBloc({
    required GetAllItemsUseCase getAllItemsUseCase,
    required SaveItemUseCase saveItemUseCase,
  })  : _getAllItemsUseCase = getAllItemsUseCase,
        _saveItemUseCase = saveItemUseCase,
        super(OverviewLoading()) {
    //

    _getAllItemsUseCase().forEach((result) {
      add(OverviewItemsUpdated(result));
    });

    on<OverviewItemsUpdated>((event, emit) async {
      emit(OverviewLoading());
      if (event.result is Success) {
        emit(OverviewSuccess((event.result as Success).data));
      } else if (event.result is Error) {
        emit(OverviewError((event.result as Error).error.toString()));
      }
    });

    on<OverviewSaveItem>((event, emit) async {
      try {
        await _saveItemUseCase(event.item);
      } catch (e) {
        emit(OverviewError("Failed to add item"));
      }
    });
  }
}
