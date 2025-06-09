import 'package:inventory/src/core/data/models/ldb_location.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LdbItem {
  @Id()
  int id = 0;

  String name;
  String? description;
  List<int>? imageBytes;
  List<String> tags;

  /// Storing enum as an int (its index).
  @Property(type: PropertyType.int)
  int? condition;

  final location = ToOne<LdbLocation>();

  LdbItem({
    this.id = 0,
    required this.name,
    this.description,
    this.imageBytes,
    required this.tags,
    this.condition,
  });
}
