import 'package:dartz/dartz.dart';

import '../../app/base_usecase.dart';
import '../../app/error/faulier.dart';
import '../models/models.dart';
import '../repository/repository.dart';

class HomeUsecse implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUsecse(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getMainData();
  }
}
