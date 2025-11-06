import 'package:inventory/src/core/domain/entities/item.dart';

sealed class DeclutterState {
  const DeclutterState();
}

class DeclutterInitial extends DeclutterState {
  const DeclutterInitial();
}

class DeclutterLoading extends DeclutterState {
  const DeclutterLoading();
}

class DeclutterSuccess extends DeclutterState {
  final List<Item> items;
  const DeclutterSuccess({
    required this.items,
  });

  DeclutterSuccess copyWith({
    List<Item>? items,
  }) {
    return DeclutterSuccess(
      items: items ?? this.items,
    );
  }
}

class DeclutterError extends DeclutterState {
  final String message;
  const DeclutterError({required this.message});
}
