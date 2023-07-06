import 'package:flutter/material.dart';
import 'package:user_auth/core/services/services.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider();

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

  late bool _showPassword = true;
  bool get showPassword => _showPassword;
  set getShowPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  init() async {
    await clean();
  }

  clean() async {
    _isLoading = false;
    _showPassword = true;

    _userError = null;
    _passError = null;

    _username = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  late TextEditingController _username = TextEditingController(text: "");
  late TextEditingController _password = TextEditingController(text: "");
  TextEditingController get email => _username;
  TextEditingController get password => _password;

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  GlobalKey<FormState> get fromKey => _fromKey;

  onLogin() async {
    if (_fromKey.currentState!.validate()) {
      await validateUser();
    }
    notifyListeners();
  }

  late String? _userError, _passError;
  String? get userError => _userError;
  String? get passError => _passError;
  set getUserError(String? value) {
    _userError = value;
    notifyListeners();
  }

  set getPasswordError(String? value) {
    _passError = value;
    notifyListeners();
  }

  validateUser() async {
    getUserError = null;
    getPasswordError = null;
    if (_username.text.trim() != "Sabin") {
      getUserError = "Username not valid.";
    }
    //
    else if (_password.text.trim() != "Sabin1") {
      getPasswordError = "Password doesnot match.";
    }
    //
    else {
      await navigateUser();
    }
  }

  navigateUser() async {
    getLoading = true;
    await Future.delayed(const Duration(seconds: 2), () async {
      ///
      await clean();

      ///
      await SetAllPref.isLogin(value: true);

      ///
      navigator.pushReplacementNamed(indexPath);
    });
    getLoading = false;
  }
}
