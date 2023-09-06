import 'package:flutter/material.dart';
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
          child: const Wrap(
            spacing: 10,
            children: [
              RouteButton(title: 'calendar_yg_test', screenWidget: HomeScreenCal()),
              RouteButton(title: 'TTS', screenWidget: SearchTTS()),
              RouteButton(title: 'MAP', screenWidget: SearchMap()),
            ],
          ),
        ),
      ),
    );
  }
}

typedef VoidWidgetFunction = Widget Function();

class RouteButton extends StatelessWidget {
  final String title;
  final Widget screenWidget;
  const RouteButton({super.key, required this.title, required this.screenWidget});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => screenWidget,
        ));
      },
      child: Text(title),
    );
  }
}
