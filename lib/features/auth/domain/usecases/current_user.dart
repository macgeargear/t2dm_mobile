import 'package:fpdart/fpdart.dart';
import 'package:t2dm_mobile/core/error/failures.dart';
import 'package:t2dm_mobile/core/usecase/usecase.dart';
import 'package:t2dm_mobile/features/auth/domain/entities/user.dart';
import 'package:t2dm_mobile/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Error, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
