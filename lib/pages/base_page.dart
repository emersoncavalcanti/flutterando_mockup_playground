import 'package:flutter/material.dart';
import 'package:flutterando_mockup/pages/about_dev_page.dart';
import 'package:flutterando_mockup/pages/activities_page/activities_page.dart';
import 'package:flutterando_mockup/pages/repositories_page.dart';
import 'package:flutterando_mockup/pages/theme_inherited.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:feather_icons/feather_icons.dart';

import '../src/themes/color_schemes.g.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  int currentPage = 0;
  late PageController pc;
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: ThemeInherited(
        themeMode: _themeMode,
        child: Scaffold(
          body: PageView(
            controller: pc,
            onPageChanged: setCurrentPage,
            children: const [
              ActivitiesPage(),
              RepositoriesPage(),
              AboutDevPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.target),
                label: 'Atividades',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.github),
                label: 'Repositórios',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Sobre o dev',
              )
            ],
            onTap: (page) {
              pc.animateToPage(
                page,
                duration: const Duration(microseconds: 400),
                curve: Curves.bounceIn,
              );
            },
          ),
        ),
      ),
    );
  }
}
