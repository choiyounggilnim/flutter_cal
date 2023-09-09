import 'package:flutter/material.dart';
import 'package:flutter_cal/screen/calendar/home_screen_cal.dart';
import 'package:flutter_cal/screen/riverpod_todo/riverpod_todo_screen.dart';
import 'package:flutter_cal/screen/search/search_map.dart';
import 'package:flutter_cal/screen/search/search_tts.dart';
import 'package:flutter_cal/screen/setting/setting_screen.dart';

enum RouteType {
  calendar(techName: 'calendar_yg_test'),
  tts(techName: 'TTS'),
  map(techName: 'MAP'),
  riverpodTodo(techName: '리버팟 todo 예제'),
  setting(techName: 'Setting');

  final String techName;

  const RouteType({
    required this.techName,
  });

  // enum에 바로 필드로 넣으려고 했는데 안 됨.. enum 필드에 람다는 못 넣나 봄.
  Widget Function(Map<String, Object>? arg) get createPage {
    switch (this) {
      case RouteType.calendar:
        return (arg) => const HomeScreenCal();
      case RouteType.tts:
        return (arg) => const SearchTTS();
      case RouteType.map:
        return (arg) => const SearchMap();
      case RouteType.setting:
        return (arg) => const SettingScreen();
      case RouteType.riverpodTodo:
        return (arg) {
          // final int paramValue = arg!['paramKey'] as int;
          return const RiverpodTodoScreen();
        };
    }
  }
}

final routePushHelper = RoutePushHelper();

class RoutePushHelper<T> {
  // context 때문에 UI에 의존하지만 테스트 안 짜니 상관없다
  Future<T?> toNamed(BuildContext context, RouteType routeType, {Map<String, Object>? arguments}) async {
    return await Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => routeType.createPage(arguments),
    ));
  }
}
