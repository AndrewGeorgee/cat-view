// ignore_for_file: void_checks

import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

import '../../app/base_view_model.dart';
import '../../app/state_renderer/state_renderer.dart';
import '../../app/state_renderer/stete_render_impl.dart';
import '../../domain/models/models.dart';
import '../../domain/usecase/home_usecase.dart';

class HomeViewModel extends BaseViewModel
    implements HomeViewModelOutput, HomeViewModelInput {
  final HomeUsecse _homeUsecase;
  final _dataStreamController = BehaviorSubject<HomeViewObject>();

  HomeViewModel(this._homeUsecase);
  @override
  Sink get inputHomeData => _dataStreamController.sink;
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);

  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _homeUsecase.execute(Void)).fold(
        (failure) => {
              // left -> failure
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());

      inputHomeData.add(HomeViewObject(homeObject.homeData.catModel));
      // navigate to main screen
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<CatImageModel> services;

  HomeViewObject(this.services);
}
