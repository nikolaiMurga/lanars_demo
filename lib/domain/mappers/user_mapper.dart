import 'package:lanars_demo/data/db/entities/user_entity.dart';
import 'package:lanars_demo/data/network/dto/user_dto.dart';
import 'package:lanars_demo/domain/models/user_model.dart';

class UserMapper {
  UserModel fromDto(UserDto dto) {
    return UserModel(
      name: '${dto.name?.first ?? 'no'} ${dto.name?.last ?? 'name'}',
      email: dto.email ?? 'no email',
      avatar: dto.picture?.thumbnail ?? 'no avatar', // should be default icon or nullable
    );
  }

  UserEntity fromModel(UserModel model) {
    return UserEntity(name: model.name, email: model.email, avatar: model.avatar);
  }

  UserModel fromEntity(entity) {
    return UserModel(name: entity.name, email: entity.email, avatar: entity.avatar);
  }
}
