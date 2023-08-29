import 'package:flutter/material.dart';
import 'package:flutter_cal/component/calendar_table.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Calendar()],
        ),
      )
    );
  }
}
