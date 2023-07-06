import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:user_auth/core/src/index/index.dart';
import 'package:user_auth/core/src/login/login.dart';
import 'package:user_auth/core/src/splash/splash.dart';

List<SingleChildWidget> myStateList = [
  ChangeNotifierProvider(create: (_) => SplashProvider()),
  ChangeNotifierProvider(create: (_) => LoginProvider()),
  ChangeNotifierProvider(create: (_) => IndexProvider()),
];
