import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth/core/src/splash/splash.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return context.read<SplashProvider>().onWillPop();
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Index"), automaticallyImplyLeading: false),
        body: const Center(child: Text("Welcome to Index Page")),
      ),
    );
  }
}
