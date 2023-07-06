import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth/core/services/services.dart';

import 'state_list.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: myStateList,
      child: const MaterialApp(
        title: 'User Auth',
        debugShowCheckedModeBanner: false,
        initialRoute: splashPath,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
