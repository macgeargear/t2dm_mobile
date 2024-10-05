import 'package:fpdart/fpdart.dart';
import 'package:t2dm_mobile/core/error/failures.dart';
import 'package:t2dm_mobile/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Error, User>> signIn({
    required String username,
    required String password,
  });
  Future<Either<Error, User>> currentUser();
}
