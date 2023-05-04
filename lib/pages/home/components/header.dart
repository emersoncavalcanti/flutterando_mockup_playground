import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme_inherited.dart';
import '../home_page.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();

    final state = context.findAncestorStateOfType<HomePageState>()!;
    final isDark = state.themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 14, 0),
      child: SizedBox(
        height: 48,
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Atividades',
                        style: TextStyle(
                          fontFamily: 'Poppins-SemiBold',
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Flutterando Masterclass',
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 12,
                            height: 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: const Icon(FontAwesomeIcons.solidMoon),
                  onTap: () {
                    if (isDark) {
                      state.changeTheme(ThemeMode.light);
                    } else {
                      state.changeTheme(ThemeMode.dark);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
