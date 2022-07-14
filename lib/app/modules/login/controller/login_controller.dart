import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:icarros/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState>{

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  final AuthService _authService;

  LoginController({required AuthService authService}) 
  : _authService = authService,
    super(const LoginState.initial());

  Future<void> SignIn() async {
    inLoader.value = true;
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await _authService.signIn();
    } catch (e) {
      
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: 'Erro ao realizar login'
      ));
      inLoader.value = false;
    }
  }
}