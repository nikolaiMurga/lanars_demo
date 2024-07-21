import 'package:lanars_demo/data/network/dto/user_dto.dart';
import 'package:lanars_demo/domain/models/user_model.dart';

class UserMapper {
  UserModel fromDto(UserDto dto) {
    return UserModel(
      name: '${dto.name?.first ?? 'no'} ${dto.name?.last ?? 'name'}',
      email: dto.email ?? 'no email',
      avatar: dto.picture?.thumbnail ?? 'no avatar', // should be default icon
    );
  }
}
