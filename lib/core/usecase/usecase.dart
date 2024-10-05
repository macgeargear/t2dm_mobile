import 'package:t2dm_mobile/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Error, SuccessType>> call(Params params);
}

class NoParams {}
