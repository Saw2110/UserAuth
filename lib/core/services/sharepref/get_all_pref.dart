import 'pref_text.dart';
import 'share_preference.dart';

class GetAllPref {
  static checkLogin() async {
    return await SharedPref.getData(
      key: PrefText.loginSuccess,
      value: false,
      type: "bool",
    );
  }
}
