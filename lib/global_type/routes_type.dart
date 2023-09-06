import 'package:flutter_cal/screen/calendar/home_screen_cal.dart';
import 'package:flutter_cal/screen/riverpod_todo/riverpod_todo_screen.dart';
import 'package:flutter_cal/screen/search/search_home_screen.dart';
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
  VoidWidgetFunction get createPage {
    switch (this) {
      case RouteType.calendar:
        return () => const HomeScreenCal();
      case RouteType.tts:
        return () => const SearchTTS();
      case RouteType.map:
        return () => const SearchMap();
      case RouteType.setting:
        return () => const SettingScreen();
      case RouteType.riverpodTodo:
        return () => const RiverpodTodoScreen();
    }
  }
}
