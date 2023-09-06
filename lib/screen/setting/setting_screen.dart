import 'package:flutter/material.dart';
import 'package:flutter_cal/user_setting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final testOnOffProvider = StateProvider((ref) => userSetting.testOnOff.get());

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
        ],
      ),
    );
  }
}
