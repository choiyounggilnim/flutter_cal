import 'package:flutter/material.dart';
import 'package:flutter_cal/screen/search/search_home_screen.dart';
import 'package:flutter_cal/user_setting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter framwork 가 준비 되었는가.

  userSetting = await UserSetting.newInstance();
  await initializeDateFormatting();

  runApp(ProviderScope(
    child: MaterialApp(
        theme: ThemeData(useMaterial3: true), darkTheme: ThemeData(useMaterial3: true), home: const SearchHomeScreen()),
  ));
}
