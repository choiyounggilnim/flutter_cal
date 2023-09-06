import 'package:flutter/material.dart';
import 'package:flutter_cal/routes/routes_type.dart';
import 'package:flutter_cal/screen/calendar/home_screen_cal.dart';
import 'package:flutter_cal/screen/search/search_map.dart';
import 'package:flutter_cal/screen/search/search_tts.dart';

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
            children: createMyWidgets(context),
            spacing: 10,
          ),
        ),
      ),
    );
  }

  List<Widget> createMyWidgets(BuildContext context) {
    print("createMyWidgets");
    List<RouteType> routeList = createRoutList(context);
    return createWidgets(routeList);
  }

  List<RouteType> createRoutList(BuildContext context) {
    List<RouteType> routeList = [];
    routeList = [
      RouteType(
        techName: "calendar_yg_test",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreenCal(),
          ));
        },
      ),
      RouteType(
        techName: "TTS",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => SearchTTS(),
          ));
        },
      ),
      RouteType(
        techName: "MAP",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => SearchMap(),
          ));
        },
      ),
    ];
    return routeList;
  }

  List<Widget> createWidgets(List<RouteType> routeList) {
    List<Widget> widgets = [];
    for (var value in routeList) {
      widgets.add(ElevatedButton(onPressed: value.onPressed, child: Text(value.techName)));
    }
    return widgets;
  }
}
