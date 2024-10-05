import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2dm_mobile/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:t2dm_mobile/core/usecase/usecase.dart';
import 'package:t2dm_mobile/features/auth/domain/entities/user.dart';
import 'package:t2dm_mobile/features/auth/domain/usecases/current_user.dart';
import 'package:t2dm_mobile/features/auth/domain/usecases/user_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserLogin userLogin,
    required AppUserCubit appUserCubit,
    required CurrentUser currentUser,
  })  : _userLogin = userLogin,
        _appUserCubit = appUserCubit,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthInitial()));
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _userLogin(UserLoginParams(
      username: event.username,
      password: event.password,
    ));
    result.fold(
      (l) => emit(AuthError(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (l) => emit(AuthError(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    emit(AuthSuccess(user));
    _appUserCubit.updateUser(user);
  }
}
