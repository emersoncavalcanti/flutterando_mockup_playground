import 'package:flutter/material.dart';

import '../../../src/themes/color_schemes.g.dart';
import '../../base_page.dart';
import '../../theme_inherited.dart';

class CustomLpi extends StatefulWidget {
  final String title;
  final double valueBar;

  const CustomLpi({super.key, required this.title, required this.valueBar});

  @override
  State<CustomLpi> createState() => _CustomLpiState();
}

class _CustomLpiState extends State<CustomLpi> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    final state = context.findAncestorStateOfType<BasePageState>()!;
    final themeMode = state.themeMode;

    return Row(
      children: [
        Flexible(
            flex: 0,
            child: SizedBox(
              width: 70,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  color: lightColorScheme.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
            )),
        Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  color: lightColorScheme.primary,
                  backgroundColor: themeMode == ThemeMode.light
                      ? lightColorScheme.background
                      : darkColorScheme.background,
                  minHeight: 9,
                  value: widget.valueBar,
                ),
              ),
            )),
      ],
    );
  }
}
