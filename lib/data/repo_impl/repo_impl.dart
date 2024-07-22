import 'package:lanars_demo/data/repo_impl/network_repo.dart';
import 'package:lanars_demo/domain/models/user_model.dart';
import 'package:lanars_demo/domain/repo/auth_repo.dart';
import 'package:lanars_demo/domain/repo/repo.dart';

import '../../domain/mappers/user_mapper.dart';
import '../network/requests/login_request.dart';
import 'local_repo.dart';

class RepoImpl extends Repo {
  final AuthRepo _authRepo;
  final NetworkRepo _networkRepo;
  final UserMapper _userMapper;
  final LocalRepo _localRepo;

  RepoImpl(this._networkRepo, this._authRepo, this._userMapper, this._localRepo);

  @override
  Future<UserModel> login({required LoginRequest request}) async {
    final userDto = await _networkRepo.login(request: request);
    final userModel = _userMapper.fromDto(userDto);

    final userEntity = _userMapper.fromModel(userModel);
    await _localRepo.saveUser(userEntity);
    await _authRepo.saveAccessToken(token: true.toString());

    return userModel;
  }

  @override
  Future<UserModel> getUser() async{
    final entity = await _localRepo.getUser();
    final model = _userMapper.fromEntity(entity);
    return model;
  }

  @override
  Future<void> logOut() async {
    await _localRepo.deleteUser();
    await _authRepo.deleteToken();
  }
}
