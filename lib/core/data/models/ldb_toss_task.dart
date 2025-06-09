import 'package:inventory/core/data/models/ldb_item.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LdbTossTask {
  @Id()
  int id = 0;

  final item = ToOne<LdbItem>();

  LdbTossTask({this.id = 0});
}
