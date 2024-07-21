import '../../data/network/requests/login_request.dart';
import '../models/user_model.dart';

abstract class Repo {
  Future<UserModel> login({required LoginRequest request});
}