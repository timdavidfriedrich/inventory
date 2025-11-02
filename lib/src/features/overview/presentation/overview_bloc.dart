import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/usecases/item/get_all_items_use_case.dart';
import 'package:inventory/src/features/overview/presentation/overview_event.dart';
import 'package:inventory/src/features/overview/presentation/overview_state.dart';

@injectable
class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final GetAllItemsUseCase _getAllItemsUseCase;

  OverviewBloc(
    this._getAllItemsUseCase,
  ) : super(OverviewLoading()) {
    on<OverviewRefreshItems>((event, emit) async {
      emit(OverviewLoading());
      if (event.result is Success) {
        emit(OverviewSuccess((event.result as Success<List<Item>>).value));
      } else if (event.result is Error) {
        emit(OverviewError((event.result as Error).error.toString()));
      }
    });

    _init();
  }

  void _init() {
    _getAllItemsUseCase().forEach((result) {
      add(OverviewRefreshItems(result));
    });
  }
}
