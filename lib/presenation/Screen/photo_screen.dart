import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  final String url;
  final String id;
  const PhotoScreen({super.key, required this.url, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration:
                BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Id:$id",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

class Go {
  final BuildContext context;
  Go(this.context);

  Future push({
    required Widget page,
    bool withoutRoot = true,
    bool withoutPageTransition = false,
  }) async {
    PageRoute route = withoutPageTransition
        ? MaterialPageRoute(
            builder: (context) => page, maintainState: !withoutRoot)
        : CupertinoPageRoute(
            builder: (context) => page, maintainState: !withoutRoot);
    return Navigator.of(context, rootNavigator: withoutRoot).push(route);
  }

  Future<bool> back() => Navigator.maybePop(context);
}
