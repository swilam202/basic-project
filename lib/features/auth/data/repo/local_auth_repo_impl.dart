part of 'auth_repo.dart';

class LocalAuthRepoImpl implements AuthRepo {
  final HiveService _hiveService;

  LocalAuthRepoImpl(this._hiveService);

  @override
  Future<Either<Failure, LoginModel>> login(LoginBody body) async {
    try {
      final response = _hiveService.get(
        NetworkConstants.login,
        body: body.toJson(),
      );
      if (response == null) {
        return Left(ErrorHandler.handle(Exception('No data found')));
      }
      return Right(LoginModel.fromJson(response));
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
