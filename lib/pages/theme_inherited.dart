import 'package:flutter/material.dart';

class ThemeInherited extends InheritedWidget {
  final ThemeMode themeMode;

  const ThemeInherited({
    super.key,
    required super.child,
    required this.themeMode,
  });

  @override
  bool updateShouldNotify(covariant ThemeInherited oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
