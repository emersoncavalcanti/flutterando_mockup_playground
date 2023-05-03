import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../src/themes/color_schemes.g.dart';
import '../theme_inherited.dart';
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
    final size = MediaQuery.of(context).size;

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
            children: [
              const Header(),
              SizedBox(
                height: 300,
                width: size.width,
                child: ListView(
                  children: [
                    Card(
                      margin: const EdgeInsets.fromLTRB(15, 20, 13, 0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        width: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 0,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 12, right: 13),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21.2),
                                      color: lightColorScheme.primary,
                                    ),
                                    width: 43,
                                    height: 43,
                                    child: Icon(
                                        color: themeMode == ThemeMode.dark
                                            ? lightColorScheme
                                                .onPrimaryContainer
                                            : darkColorScheme
                                                .onPrimaryContainer,
                                        FontAwesomeIcons.personRunning),
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Animações',
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 11),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Exercicios: ',
                                          style: TextStyle(
                                            color: lightColorScheme
                                                .onSurfaceVariant,
                                            fontFamily:
                                                themeMode == ThemeMode.dark
                                                    ? 'Montserrat-Regular'
                                                    : 'Poppins-Regular',
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Text(
                                          ' 4',
                                          style: TextStyle(
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(16, 37, 15, 0),
                              child: Text(
                                'Estudos sobre animações implicítas e controladas, contendo 4 exercícios e 2 estudos',
                                style: TextStyle(
                                    color: lightColorScheme.onSurfaceVariant,
                                    fontFamily: themeMode == ThemeMode.dark
                                        ? 'Montserrat-Regular'
                                        : 'Poppins-Regular',
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 41.5,
                                    bottom: 30.5,
                                    left: 18.56,
                                    right: 10.56),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          const Icon(FontAwesomeIcons.github),
                                          Text(
                                            ' Acessar código fonte',
                                            style: TextStyle(
                                              fontFamily:
                                                  themeMode == ThemeMode.dark
                                                      ? 'Montserrat-Regular'
                                                      : 'Poppins-Medium',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 119,
                                        height: 34.5,
                                        decoration: BoxDecoration(
                                          color: lightColorScheme.primary,
                                          borderRadius:
                                              BorderRadius.circular(59.5),
                                        ),
                                        child: Text(
                                          'Ver mais',
                                          style: TextStyle(
                                            color: lightColorScheme.onPrimary,
                                            fontFamily:
                                                themeMode == ThemeMode.dark
                                                    ? 'Poppins-SemiBold'
                                                    : 'Poppins-Medium',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
