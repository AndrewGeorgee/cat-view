import 'package:cat/presenation/Screen/photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../app/git.dart';
import '../../app/state_renderer/stete_render_impl.dart';
import '../../domain/models/models.dart';
import 'main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: const TabBar(tabs: [
            Center(
                child: Text(
              'Cats',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ))
          ]),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<FlowState>(
                stream: _viewModel.outputState,
                builder: (context, snapshot) {
                  return snapshot.data
                          ?.getScreenWidget(context, _getContentWidget(), () {
                        _viewModel.start();
                      }) ??
                      _getContentWidget();
                }),
          ],
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getServicesWidget2(snapshot.data?.services),
            ],
          );
        });
  }

  Widget _getServicesWidget2(List<CatImageModel>? services) {
    if (services != null) {
      return Expanded(
        child: MasonryGridView.count(
          itemCount: services.length,
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoScreen(
                            url: services[index].image, id: services[index].id),
                      ));
                  // toast(" ID : ${services[index].id}");
                },
                child: Image.network(services[index].image));
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
