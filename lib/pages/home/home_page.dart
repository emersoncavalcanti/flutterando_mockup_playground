import 'package:flutter/material.dart';
import '../../src/themes/color_schemes.g.dart';
import 'components/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: ThemeInherited(
        themeMode: _themeMode,
        child: Scaffold(
          body: Column(
            children: const [
              Header(),
            ],
          ),
        ),
      ),
    );
  }
}

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
