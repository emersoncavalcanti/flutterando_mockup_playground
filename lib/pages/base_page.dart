import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterando_mockup/pages/repositories_page.dart';

import 'package:flutterando_mockup/pages/theme_inherited.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../src/shared/header.dart';
import '../src/themes/color_schemes.g.dart';
import 'about_dev_page/about_dev_page.dart';
import 'activities_page/activities_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
  int currentPage = 0;
  late String title = 'Atividades';
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

      if (page == 0) {
        title = 'Atividades';
      } else if (page == 1) {
        title = 'Repositórios';
      } else {
        title = 'Sobre o Dev';
      }
    });
  }

  changePage(page) {
    pc.animateToPage(
      page,
      duration: const Duration(microseconds: 400),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: ThemeInherited(
        themeMode: _themeMode,
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: PageView(
                  controller: pc,
                  onPageChanged: setCurrentPage,
                  children: const [
                    ActivitiesPage(),
                    RepositoriesPage(),
                    AboutDevPage(),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  color: themeMode == ThemeMode.dark
                      ? darkColorScheme.background
                      : lightColorScheme.background,
                  width: size.width,
                  height: 124,
                  child: const Header(
                      title: 'Atividades', subtitle: 'Flutterando Masterclass'),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  width: size.width,
                  height: 90,
                  color: themeMode == ThemeMode.dark
                      ? darkColorScheme.background
                      : lightColorScheme.background,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () => changePage(0),
                                  icon: const Icon(
                                    FeatherIcons.target,
                                  ),
                                ),
                                const Text(
                                  'Atividades',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 12,
                                    height: 0.1,
                                  ),
                                ),
                              ],
                            ),
                            const VerticalDivider(),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () => changePage(1),
                                  icon: const Icon(FontAwesomeIcons.github),
                                ),
                                const Text(
                                  'Repositórios',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 12,
                                    height: 0.1,
                                  ),
                                ),
                              ],
                            ),
                            const VerticalDivider(),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () => changePage(2),
                                  icon: const Icon(Icons.person),
                                ),
                                const Text(
                                  'Sobre o dev',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 12,
                                    height: 0.1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
