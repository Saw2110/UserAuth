import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_auth/core/services/services.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider();

  late BuildContext _context;
  BuildContext get context => _context;
  late final NavigatorState navigator = Navigator.of(_context);
  set getContext(BuildContext value) {
    _context = value;

    ///
    init();
  }

  late bool _isLoading = false;
  bool get isLoading => _isLoading;
  set getLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  onWillPop() {
    return SystemNavigator.pop(animated: false);
  }

  init() async {
    await clean();
    await startTimer();
  }

  clean() async {
    _isLoading = false;
    FToast().init(context);
  }

  startTimer() async {
    Future.delayed(const Duration(seconds: 1), () async {
      await checkSession();
    });
  }

  checkSession() async {
    bool isLogin = await GetAllPref.checkLogin();

    if (!isLogin) {
      navigator.pushReplacementNamed(loginPath);
    }
    //
    else {
      navigator.pushReplacementNamed(indexPath);
    }
    notifyListeners();
  }
}
