import 'package:objectbox/objectbox.dart';

@Entity()
class LdbLocation {
  @Id()
  int id;
  int roomId;
  int? groupId;

  LdbLocation({
    this.id = 0,
    required this.roomId,
    this.groupId,
  });
}
