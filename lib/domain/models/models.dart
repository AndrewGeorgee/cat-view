class CatImageModel {
  String id;
  String image;
  double width;
  double height;

  CatImageModel(this.id, this.image, this.width, this.height);
}

class HomeData {
  List<CatImageModel> catModel;
  HomeData(this.catModel);
}

class HomeObject {
  HomeData homeData;

  HomeObject(this.homeData);
}
