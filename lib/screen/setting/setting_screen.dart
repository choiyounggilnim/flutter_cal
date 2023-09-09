import 'package:flutter/material.dart';
import 'package:flutter_cal/global/type/theme_type.dart';
import 'package:flutter_cal/global/widget/app_toggle_buttons.dart';
import 'package:flutter_cal/user_setting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          SwitchListTile(
              title: const Text('스위치 테스트'),
              value: userSetting.testOnOff.watch(ref),
              onChanged: (value) {
                userSetting.testOnOff.setAndNotify(value, ref);
              }),
          AppToggleButtons(
            initValue: userSetting.themeType.watch(ref).displayName,
            stringValues: ThemeType.values.map((e) => e.displayName).toList(),
            onPressed: (index) {
              var selectedThemeType = ThemeType.values[index];
              userSetting.themeType.setAndNotify(selectedThemeType, ref);
            },
          ),
        ],
      ),
    );
  }
}
