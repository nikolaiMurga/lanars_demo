import 'package:hive/hive.dart';

import '../persistence_helper.dart';

part 'user_entity.g.dart';

@HiveType(typeId: HiveTypeIds.user)
class UserEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;
  @HiveField(2)
  final String avatar;

  UserEntity({required this.name, required this.email, required this.avatar});
}
