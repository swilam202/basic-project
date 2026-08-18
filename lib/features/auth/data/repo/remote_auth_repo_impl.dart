part of 'auth_repo.dart';

class RemoteAuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  RemoteAuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, LoginModel>> login(LoginBody body) async {
    try {
      final response = await _apiService.post(
        NetworkConstants.login,
        body: body.toJson(),
      );
      return Right(LoginModel.fromJson(response.data));
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
