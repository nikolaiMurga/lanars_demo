import 'package:lanars_demo/data/repo_impl/network_repo.dart';
import 'package:lanars_demo/domain/models/user_model.dart';
import 'package:lanars_demo/domain/repo/auth_repo.dart';
import 'package:lanars_demo/domain/repo/repo.dart';

import '../../domain/mappers/user_mapper.dart';
import '../network/requests/login_request.dart';

class RepoImpl extends Repo {
  final AuthRepo _authRepo;
  final NetworkRepo _networkRepo;
  final UserMapper _userMapper;

  RepoImpl(this._networkRepo, this._authRepo, this._userMapper);

  @override
  Future<UserModel> login({required LoginRequest request}) async {
    final userDto = await _networkRepo.login(request: request);
    final user = _userMapper.fromDto(userDto);
    await _authRepo.saveAccessToken(token: true.toString());
    return user;
  }
}
