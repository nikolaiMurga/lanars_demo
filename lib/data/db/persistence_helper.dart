import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'entities/user_entity.dart';

class HiveBoxes {
  static const userBox = 'cats_fact_box';
}

class HiveTypeIds {
  static const user = 0;
}

class PersistenceHelper {
  static Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    //register adapters
    Hive.registerAdapter(UserEntityAdapter());

    //open boxes
    await Future.wait([
      Hive.openBox(HiveBoxes.userBox),
    ]);

    // await PersistenceHelper.clearBoxes();
  }

  static Future<void> clearBoxes() async {
    //clear boxes per app launch
    await Future.wait([
      Hive.box(HiveBoxes.userBox).clear(),
    ]);
  }
}
