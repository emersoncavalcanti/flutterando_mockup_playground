import 'package:flutter/material.dart';

import '../../base_page.dart';
import '../../theme_inherited.dart';

class CustomCard extends StatefulWidget {
  final String title;

  const CustomCard({
    super.key,
    required this.title,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    final state = context.findAncestorStateOfType<BasePageState>()!;
    final themeMode = state.themeMode;

    final image = themeMode == ThemeMode.dark
        ? Image.asset('assets/images/flutter-light.png')
        : Image.asset('assets/images/flutter-dark.png');

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27),
      ),
      child: SizedBox(
        width: 100,
        height: 94,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          image,
          Padding(
            padding: const EdgeInsets.only(top: 8.6),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 14,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
