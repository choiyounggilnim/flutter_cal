import 'package:flutter_cal/screen/calendar/home_screen_cal.dart';
import 'package:flutter_cal/screen/search/search_home_screen.dart';
import 'package:flutter_cal/screen/search/search_map.dart';
import 'package:flutter_cal/screen/search/search_tts.dart';

enum RouteType {
  calendar(techName: 'calendar_yg_test'),
  tts(techName: 'TTS'),
  map(techName: 'MAP');

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
    }
  }
}
