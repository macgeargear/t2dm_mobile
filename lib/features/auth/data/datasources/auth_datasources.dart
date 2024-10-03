import 'package:fpdart/fpdart.dart';
import 'package:t2dm_mobile/core/error/failures.dart';

abstract interface class AuthDatasources {
  Future<Either<Failure, String>> login(String username, String password);
  Future<Either<Failure, String>> register(String username, String password);
}
