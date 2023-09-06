import 'package:flutter/material.dart';
import 'package:flutter_cal/routes/routes_type.dart';

class SearchHomeScreen extends StatelessWidget {
  const SearchHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //이거 왜 호출 처음에 두번되는거임?
    print("build");
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Wrap(
            spacing: 10,
            children: RouteType.values
                .map((routeType) => RouteButton(title: routeType.techName, screenBuilder: routeType.createPage))
                .toList(),
          ),
        ),
      ),
    );
  }
}

typedef VoidWidgetFunction = Widget Function();

// 정리가 된 것 같지만 파라미터는 어떻게??????
class RouteButton extends StatelessWidget {
  final String title;
  final VoidWidgetFunction screenBuilder;
  const RouteButton({super.key, required this.title, required this.screenBuilder});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => screenBuilder(),
        ));
      },
      child: Text(title),
    );
  }
}
