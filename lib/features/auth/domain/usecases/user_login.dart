import 'package:fpdart/fpdart.dart';
import 'package:t2dm_mobile/core/error/failures.dart';
import 'package:t2dm_mobile/core/usecase/usecase.dart';
import 'package:t2dm_mobile/features/auth/domain/entities/user.dart';
import 'package:t2dm_mobile/features/auth/domain/repositories/auth_repository.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;

  const UserLogin(this.authRepository);

  @override
  Future<Either<Error, User>> call(UserLoginParams params) async {
    return await authRepository.signIn(
      username: params.username,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String username;
  final String password;

  UserLoginParams({required this.username, required this.password});
}
