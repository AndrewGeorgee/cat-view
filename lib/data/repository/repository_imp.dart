import 'dart:developer';

import 'package:cat/data/mapper/mapper.dart';
import 'package:dartz/dartz.dart';

import '../../app/error/error_handler.dart';
import '../../app/error/faulier.dart';
import '../../domain/models/models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInformation _networkInformation;

  RepositoryImpl(
    this._remoteDataSource,
    this._networkInformation,
  );

  @override
  Future<Either<Failure, HomeObject>> getMainData() async {
    if (await _networkInformation.isConnected) {
      //!its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.geyHomeData();

        if (response.statuse == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //! return internet connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
