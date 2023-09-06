import 'package:flutter/material.dart';
import 'package:flutter_cal/global_type/theme_type.dart';
import 'package:flutter_cal/reusable_widget/app_toggle_buttons.dart';
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
              value: ref.watch(testOnOffProvider),
              onChanged: (value) {
                userSetting.testOnOff.set(value);
                ref.read(testOnOffProvider.notifier).state = value;
              }),
          AppToggleButtons(
            initValue: userSetting.themeType.get().displayName,
            stringValues: ThemeType.values.map((e) => e.displayName).toList(),
            onPressed: (index) {
              var selectedThemeType = ThemeType.values[index];
              userSetting.themeType.set(selectedThemeType);
              ref.read(themeTypeProvider.notifier).state = selectedThemeType;
            },
          ),
        ],
      ),
    );
  }
}
