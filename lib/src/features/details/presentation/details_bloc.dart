import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/usecases/item/archive_item_use_case.dart';
import 'package:inventory/src/core/domain/usecases/item/get_item_by_id_use_case.dart';
import 'package:inventory/src/core/domain/usecases/item/save_item_use_case.dart';
import 'package:inventory/src/features/details/presentation/details_event.dart';
import 'package:inventory/src/features/details/presentation/details_state.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetItemByIdUseCase _getItemByIdUseCase;
  final SaveItemUseCase _saveItemUseCase;
  final ArchiveItemUseCase _archiveItemUseCase;

  DetailsBloc(
    this._getItemByIdUseCase,
    this._saveItemUseCase,
    this._archiveItemUseCase,
  ) : super(DetailsLoading()) {
    on<DetailsInit>(_init);
    on<DetailsUpdateImage>(_updateImage);
    on<DetailsUpdateName>(_updateName);
    on<DetailsUpdateNotes>(_updateNotes);
    on<DetailsAddTag>(_addTag);
    on<DetailsRemoveTag>(_removeTag);
    on<DetailsSaveItem>(_saveItem);
    on<DetailsArchiveItem>(_archiveItem);
    on<DetailsDeleteItem>(_deleteItem);
    on<DetailsDeclutterItem>(_declutterItem);
    on<DetailsManageView>((event, emit) {});
  }

  void _init(DetailsInit event, Emitter<DetailsState> emit) {
    if (event.id != null) {
      _loadItemById(event, emit);
    } else {
      _createNewItem(event, emit);
    }
  }

  void _createNewItem(DetailsInit event, Emitter<DetailsState> emit) {
    final newItem = Item(
      image: event.scanResult?.imageData,
      name: event.scanResult?.name ?? "",
      suggestedTags: event.scanResult?.suggestedTags ?? [],
    );
    emit(DetailsSuccess(item: newItem));
  }

  void _loadItemById(DetailsInit event, Emitter<DetailsState> emit) async {
    final id = event.id;
    if (id == null) return;
    emit(DetailsLoading());
    _getItemByIdUseCase(id).then((result) {
      if (result is Success<Item?>) {
        final item = result.value;
        if (item != null) {
          emit(DetailsSuccess(item: item));
        } else {
          emit(DetailsError(message: "Item not found"));
        }
      } else if (result is Error) {
        emit(DetailsError(message: result.toString()));
      }
    });
  }

  void _updateImage(DetailsUpdateImage event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    final currentState = state as DetailsSuccess;
    final updatedItem = currentState.item.copyWith(image: event.imageData);
    emit(currentState.copyWith(item: updatedItem));
  }

  void _updateName(DetailsUpdateName event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    final currentState = state as DetailsSuccess;
    final updatedItem = currentState.item.copyWith(name: event.name);
    emit(currentState.copyWith(item: updatedItem));
  }

  void _updateNotes(DetailsUpdateNotes event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    final currentState = state as DetailsSuccess;
    final updatedItem = currentState.item.copyWith(notes: event.notes);
    emit(DetailsSuccess(item: updatedItem));
  }

  void _addTag(DetailsAddTag event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    final currentState = state as DetailsSuccess;
    final updatedItem = currentState.item.copyWith(
      tags: [...currentState.item.tags, event.tag],
    );
    emit(currentState.copyWith(item: updatedItem));
  }

  void _removeTag(DetailsRemoveTag event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    final currentState = state as DetailsSuccess;
    final updatedItem = currentState.item.copyWith(
      tags: List.from(currentState.item.tags)..remove(event.tag),
    );
    emit(currentState.copyWith(item: updatedItem));
  }

  void _saveItem(DetailsSaveItem event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    final currentState = state as DetailsSuccess;
    _saveItemUseCase(currentState.item).then((result) {
      if (result is Success) {
        emit(const DetailsDone());
      } else if (result is Error) {
        emit(DetailsError(message: result.error.toString()));
      }
    });
  }

  void _archiveItem(DetailsArchiveItem event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    final currentState = state as DetailsSuccess;
    _archiveItemUseCase(currentState.item).then((result) {
      if (result is Success) {
        emit(const DetailsDone());
      } else if (result is Error) {
        emit(DetailsError(message: result.error.toString()));
      }
    });
  }

  void _deleteItem(DetailsDeleteItem event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    // TODO: Implement delete logic
    emit(const DetailsDone());
  }

  void _declutterItem(DetailsDeclutterItem event, Emitter<DetailsState> emit) {
    if (state is! DetailsSuccess) return;
    // TODO: Implement declutter logic
    emit(const DetailsDone());
  }
}
