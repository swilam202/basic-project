import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/login_body.dart';
import '../../data/models/login_model.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _useCase;
  LoginCubit(this._useCase) : super(LoginInitial());

  Future<void> login(LoginBody body) async {
    emit(LoginLoading());
    final result = await _useCase(body);
    result.fold((l) => emit(LoginFailure(l)), (r) => emit(LoginSuccess(r)));
  }
}
