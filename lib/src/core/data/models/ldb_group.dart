import 'package:objectbox/objectbox.dart';

@Entity()
class LdbGroup {
  @Id()
  int id = 0;

  String name;
  String? description;
  List<int>? imageBytes;

  final subGroup = ToOne<LdbGroup>();

  LdbGroup({
    this.id = 0,
    required this.name,
    this.description,
    this.imageBytes,
  });
}
