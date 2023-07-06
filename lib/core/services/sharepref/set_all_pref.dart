import 'sharepref.dart';

class SetAllPref {
  static isLogin({required bool value}) async {
    await SharedPref.setData(
      key: PrefText.loginSuccess,
      value: value,
      type: "bool",
    );
  }
}
