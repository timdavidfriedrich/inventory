import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:inventory/objectbox.g.dart';

const String _databaseName = "local_database";

@injectable
class LocalDatabase {
  late final Store store;

  LocalDatabase._create(this.store) {
    // Additional setup
  }

  @factoryMethod
  @preResolve
  static Future<LocalDatabase> create() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(appDirectory.path, _databaseName));
    return LocalDatabase._create(store);
  }
}
