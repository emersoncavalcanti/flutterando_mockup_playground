import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../src/themes/color_schemes.g.dart';
import '../../base_page.dart';
import '../../theme_inherited.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String image;
  const CustomCard(
      {super.key,
      required this.title,
      this.image = 'assets/images/flutter.svg'});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    final state = context.findAncestorStateOfType<BasePageState>()!;
    final themeMode = state.themeMode;

    final Widget svgIcon = SvgPicture.asset(
      widget.image,
      colorFilter: ColorFilter.mode(
          themeMode == ThemeMode.dark
              ? lightColorScheme.background
              : darkColorScheme.background,
          BlendMode.srcIn),
    );

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27),
      ),
      child: SizedBox(
        width: 100,
        height: 94,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          svgIcon,
          Padding(
            padding: const EdgeInsets.only(top: 8.6),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 12,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
