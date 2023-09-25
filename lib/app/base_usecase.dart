import 'package:dartz/dartz.dart';

import 'error/faulier.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
