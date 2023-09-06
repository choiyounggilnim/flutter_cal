import 'package:flutter/material.dart';
import 'package:flutter_cal/screen/search/search_home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter framwork 가 준비 되었는가.
  await initializeDateFormatting();

  runApp(MaterialApp(home: SearchHomeScreen()));
}
