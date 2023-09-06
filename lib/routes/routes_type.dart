import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class RouteType {
  final String techName;
  final VoidCallback onPressed;

  const RouteType({
    required this.techName,
    required this.onPressed,
  });
}



