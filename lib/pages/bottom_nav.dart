import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentPage = 0;
  late PageController pc;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
