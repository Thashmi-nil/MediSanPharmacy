// ignore_for_file: constant_identifier_names
import 'dart:math';
import 'package:flutter/material.dart';

abstract class CustomColors {
  CustomColors._();
  static const Color PRIMARY = Color.fromRGBO(2, 195, 153, 1);
  static const Color SURFACE = Color(0xFFEBEBEB);
  static const Color ONSURFACE = Color(0xFF2F2E41);
  static const Color PRIMARY_VARIANT = Color(0xFF27C96D);
  static const Color ERROR = Color(0xFFEB5555);
  static const Color SECONDARY = Color(0xFF808080);
  static const Color BACKGROUND = Color(0xFFFFFFFF);
  static const Color SCAFFOLD = Color.fromARGB(255, 218, 255, 240);
  static const Color DARKISH = Color(0xFFFF3DD2);

  static Color darker(Color c) {
    return change(c, 0.8);
  }

  static Color lighter(Color c) {
    return change(c, 1.2);
  }

  static Color change(Color c, double ratio) {
    assert(ratio > 0);
    return Color.fromARGB(
      c.alpha,
      min((c.red * ratio).round(), 0xFF),
      min((c.green * ratio).round(), 0xFF),
      min((c.blue * ratio).round(), 0xFF),
    );
  }
}
