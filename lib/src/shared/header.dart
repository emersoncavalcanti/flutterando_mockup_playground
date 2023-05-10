import 'package:flutter/material.dart';
import '../../pages/base_page.dart';
import '../../pages/theme_inherited.dart';

class Header extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool backPage;

  const Header({
    super.key,
    required this.title,
    required this.subtitle,
    this.backPage = false,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    var state = context.findAncestorStateOfType<BasePageState>()!;

    changeTheme(ThemeMode themeMode) {
      setState(() {
        state.changeTheme(themeMode);
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 14, 0),
        child: SizedBox(
          height: 45,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 0,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: widget.backPage
                      ? InkWell(
                          child: state.themeMode == ThemeMode.dark
                              ? Image.asset(
                                  'assets/images/arrow-back-light.png')
                              : Image.asset(
                                  'assets/images/arrow-back-dark.png'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      : Image.asset('assets/images/logo.png'),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontFamily: 'Poppins-SemiBold',
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.subtitle,
                          style: const TextStyle(
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
                    child: state.themeMode == ThemeMode.dark
                        ? Image.asset('assets/images/moon-light.png')
                        : Image.asset('assets/images/moon-dark.png'),
                    onTap: () {
                      if (state.themeMode == ThemeMode.dark) {
                        changeTheme(ThemeMode.light);
                      } else {
                        changeTheme(ThemeMode.dark);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
