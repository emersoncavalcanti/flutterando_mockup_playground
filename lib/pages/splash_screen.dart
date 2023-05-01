import 'package:flutter/material.dart';

import '../src/custoM_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.background,
      child: Center(
        child: Image.asset('assets/images/masterclass_logo.png'),
      ),
    );
  }
}
