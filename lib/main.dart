import 'package:flutter/material.dart';
import 'package:flutter_cal/screen/search/search_home_screen.dart';
import 'package:flutter_cal/screen/setting/setting_screen.dart';
import 'package:flutter_cal/user_setting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter framwork 가 준비 되었는가.

  userSetting = await UserSetting.newInstance();
  await initializeDateFormatting();

  runApp(const ProviderScope(child: RootWidget()));
}

class RootWidget extends ConsumerWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = ref.watch(themeTypeProvider);

    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        themeMode: themeType.themeMode,
        home: const SearchHomeScreen());
  }
}
