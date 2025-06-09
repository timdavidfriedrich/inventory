import 'package:inventory/src/core/data/models/ldb_item.dart';
import 'package:inventory/src/core/data/models/ldb_location.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LdbMoveTask {
  @Id()
  int id = 0;

  final item = ToOne<LdbItem>();

  final destination = ToOne<LdbLocation>();

  LdbMoveTask({this.id = 0});
}
