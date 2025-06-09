import 'package:objectbox/objectbox.dart';

@Entity()
class LdbRoom {
  @Id()
  int id = 0;

  String name;
  String? description;
  List<int>? imageBytes;

  LdbRoom({
    this.id = 0,
    required this.name,
    this.description,
    this.imageBytes,
  });
}
