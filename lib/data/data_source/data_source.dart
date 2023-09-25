import '../network/app_api.dart';
import '../responce/respoce.dart';

abstract class RemoteDataSource {
  Future<HomeResponse> geyHomeData();
}

class RemoteDataSourceImp implements RemoteDataSource {
  final AppServiceClient _appService;

  RemoteDataSourceImp(this._appService);

  @override
  Future<HomeResponse> geyHomeData() async {
    return await _appService.getHomeData();
  }
}
