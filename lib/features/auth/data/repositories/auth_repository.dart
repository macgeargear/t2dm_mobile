import 'package:fpdart/fpdart.dart';
import 'package:t2dm_mobile/core/error/exceptions.dart';
import 'package:t2dm_mobile/core/error/failures.dart';
import 'package:t2dm_mobile/features/auth/data/datasources/auth_datasources.dart';
import 'package:t2dm_mobile/features/auth/domain/entities/user.dart';
import 'package:t2dm_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasources authDatasources;

  const AuthRepositoryImpl(this.authDatasources);

  @override
  Future<Either<Error, User>> signIn(
      {required String username, required String password}) async {
    try {
      final user = await authDatasources.login(username, password);
      return right(user);
    } on ServerException catch (e) {
      return left(Error(e.message));
    }
  }

  @override
  Future<Either<Error, User>> currentUser() async {
    try {
      final user = await authDatasources.getCurrentUserData();
      if (user == null) {
        return left(Error("User not logged in"));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Error(e.message));
    }
  }
}
