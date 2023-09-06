import 'package:flutter/material.dart';
import 'package:flutter_cal/user_setting.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          SwitchListTile(
              title: const Text('스위치 테스트'),
              value: userSetting.testOnOff.get(),
              onChanged: (value) {
                setState(() {
                  userSetting.testOnOff.set(value);
                });
              }),
        ],
      ),
    );
  }
}
