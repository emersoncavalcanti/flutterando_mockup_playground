import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../src/themes/color_schemes.g.dart';
import '../theme_inherited.dart';
import 'components/custom_card.dart';
import 'components/header.dart';
import 'package:material_symbols_icons/symbols.dart';

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
          body: ListView(
            children: [
              const SafeArea(child: Header()),
              CustomCard(
                icon: FontAwesomeIcons.personRunning,
                title: 'Animações',
                text:
                    'Estudos sobre animações implicítas e controladas, contendo 4 exercícios e 2 estudos',
                numberExercise: '4',
                function: () {},
              ),
              CustomCard(
                icon: FontAwesomeIcons.glasses,
                title: 'Leitura de Mockup',
                text:
                    'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
                numberExercise: '2',
                function: () {},
              ),
              CustomCard(
                icon: Symbols.toys_fan,
                title: 'Playground',
                text: 'Ambiente destinado a testes e estudos em geral',
                numberExercise: '3',
                function: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
