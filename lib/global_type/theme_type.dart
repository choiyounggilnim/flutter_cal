import 'package:flutter/material.dart';

enum ThemeType {
  light('라이트', ThemeMode.light),
  dark('다크', ThemeMode.dark),
  system('시스템', ThemeMode.system);

  final String displayName;
  final ThemeMode themeMode;

  const ThemeType(this.displayName, this.themeMode);
}
