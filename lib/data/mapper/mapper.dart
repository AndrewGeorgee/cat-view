import '../mapper/extention.dart';

import '../../app/constants.dart';
import '../../domain/models/models.dart';
import '../responce/respoce.dart';

extension CatImageResponseMapper on CatImageResponse? {
  CatImageModel toDomain() {
    return CatImageModel(
      this?.id.orEmpty() ?? Constant.empty,
      this?.image.orEmpty() ?? Constant.empty,
      this?.width.orDouble() ?? Constant.dzero,
      this?.height.orDouble() ?? Constant.dzero,
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<CatImageModel> services = (this
                ?.data
                ?.services
                ?.map((serviceResponse) => serviceResponse.toDomain()) ??
            const Iterable.empty())
        .cast<CatImageModel>()
        .toList();

    var data = HomeData(
      services,
    );
    return HomeObject(data);
  }
}
