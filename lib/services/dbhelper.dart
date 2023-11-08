import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

import '../models/todo.dart';

class DbHelper {
  static late Isar _isar;

  static init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = Isar.open(
      schemas: [TodoSchema],
      directory: dir.path,
    );
  }
}
