import 'package:basic_project/core/data/hive_services.dart';
import 'package:basic_project/core/network/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/network/network_constants.dart';
import '../../../../core/network/network_service.dart';
import '../models/login_body.dart';
import '../models/login_model.dart';

part 'remote_auth_repo_impl.dart';
part 'local_auth_repo_impl.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(LoginBody body);
}
