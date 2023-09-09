import 'package:flutter/material.dart';
import 'package:flutter_cal/global/type/routes_type.dart';

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
                .map((RouteType routeType) => ElevatedButton(
                      onPressed: () {
                        routePushHelper.toNamed(context, routeType);
                      },
                      child: Text(routeType.techName),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
