import 'package:inventory/src/core/domain/entities/item.dart';

sealed class DeclutterEvent {
  const DeclutterEvent();
}

class DeclutterSubscriptionRequested extends DeclutterEvent {}

class DeclutterKeep extends DeclutterEvent {
  final Item item;
  const DeclutterKeep({required this.item});
}

class DeclutterToss extends DeclutterEvent {
  final Item item;
  const DeclutterToss({required this.item});
}

class DeclutterMove extends DeclutterEvent {
  final Item item;
  const DeclutterMove({required this.item});
}

class DeclutterSkip extends DeclutterEvent {
  final Item item;
  const DeclutterSkip({required this.item});
}
