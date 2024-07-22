import 'package:hive/hive.dart';
import 'package:lanars_demo/data/db/entities/user_entity.dart';

import '../db/persistence_helper.dart';

class LocalRepo {
  final _userKey = 'user';

  LocalRepo();

  Future<void> saveUser(UserEntity entity) async {
    try {
      await Hive.box(HiveBoxes.userBox).delete(_userKey);
      await Hive.box(HiveBoxes.userBox).put(_userKey, entity);
    } catch (error) {
      rethrow;
    }
  }

  Future<UserEntity> getSavedFacts() async {
    try {
      final entity = await Hive.box(HiveBoxes.userBox).get(_userKey);
      // final model = _userMapper.fromEntity(entity);
      // return model;
      return entity;
    } catch (error) {
      rethrow;
    }
  }
}
