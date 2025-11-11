import 'package:objectbox/objectbox.dart';

@Entity()
class LdbDeclutterSession {
  @Id()
  int id = 0;

  String contextName;
  List<int> itemIds;

  int progressIndex;

  @Property(type: PropertyType.int)
  int status;

  @Property(type: PropertyType.date)
  DateTime? createdAt;

  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  LdbDeclutterSession({
    this.id = 0,
    required this.contextName,
    required this.itemIds,
    this.progressIndex = 0,
    this.status = 0,
    this.createdAt,
    this.updatedAt,
  });
}
