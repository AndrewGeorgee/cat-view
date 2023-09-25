import 'package:dartz/dartz.dart';

import '../../app/error/faulier.dart';
import '../models/models.dart';

abstract class Repository {
  Future<Either<Failure, HomeObject>> getMainData();
}
