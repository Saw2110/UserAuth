import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth/core/constants/constants.dart';

import 'splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context, listen: false).getContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, provider, child) {
        return WillPopScope(
          onWillPop: () {
            return provider.onWillPop();
          },
          child: Scaffold(
            body: Center(
              child: Image.asset(
                Assets.logo,
                height: 150.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
