import 'package:basic_project/core/utils/connectivity_services.dart';
import 'package:basic_project/features/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/login_body.dart';
import '../../data/models/login_model.dart';

class LoginUseCase {
  final LocalAuthRepoImpl _localAuthRepo;
  final RemoteAuthRepoImpl _remoteAuthRepo;
  final ConnectivityService _connectivityService;

  LoginUseCase(
    this._localAuthRepo,
    this._remoteAuthRepo,
    this._connectivityService,
  );

  Future<Either<Failure, LoginModel>> call(LoginBody body) async {
    if (_connectivityService.isOnline) {
      final Either<Failure, LoginModel> remoteResponse = await _remoteAuthRepo.login(body);

      if (remoteResponse.isLeft()) {
        final Either<Failure, LoginModel> cachedResponse = await _localAuthRepo
            .login(body);
        if (cachedResponse.isRight()) {
          return cachedResponse;
        }
      }
      return remoteResponse;
    } else {
      return await _localAuthRepo.login(body);
    }
  }
}
