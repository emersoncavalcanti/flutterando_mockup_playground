import 'package:flutter/material.dart';
import 'package:flutterando_mockup/src/themes/color_schemes.g.dart';

import '../../base_page.dart';
import '../../theme_inherited.dart';

class CustomList extends StatefulWidget {
  final String title;
  final int indice;
  const CustomList({super.key, required this.title, required this.indice});

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
    context.findAncestorStateOfType<BasePageState>()!;
    final size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: SizedBox(
        width: size.width,
        height: 64,
        child: Row(children: [
          Flexible(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(
                left: 14,
              ),
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                '${widget.indice}',
                style: TextStyle(
                  color: lightColorScheme.onPrimary,
                  fontFamily: 'Poppins-Medium',
                  fontSize: 15,
                ),
              )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
