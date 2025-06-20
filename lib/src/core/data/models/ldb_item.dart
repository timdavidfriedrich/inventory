import 'package:inventory/src/core/data/models/ldb_location.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LdbItem {
  @Id()
  int id = 0;
  bool isArchived;
  String name;
  String? notes;
  List<int>? imageBytes;
  List<String> tags;
  List<String> suggestedTags;

  /// Storing enum as an int (its index).
  @Property(type: PropertyType.int)
  int? condition;

  final location = ToOne<LdbLocation>();

  LdbItem({
    this.id = 0,
    this.isArchived = false,
    required this.name,
    this.notes,
    this.imageBytes,
    this.tags = const [],
    this.suggestedTags = const [],
    this.condition,
  });
}
