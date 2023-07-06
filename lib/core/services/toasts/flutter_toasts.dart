import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_auth/core/themes/themes.dart';
import 'package:user_auth/core/utils/utils.dart';

class ShowToast {
  ShowToast();

  static success({required String msg}) async {
    await ShowToast()._customToast(
      color: successColor,
      icon: Icons.check,
      msg: msg,
    );
  }

  static failure({required String msg}) async {
    await ShowToast()._customToast(
      color: errorColor,
      icon: Icons.close,
      msg: msg,
    );
  }

  static networkFailed() async {
    await ShowToast()._customToast(
      color: errorColor,
      icon: Icons.wifi_off,
      msg: "No internet connection.",
    );
  }

  _customToast({
    required Color color,
    required IconData icon,
    required String msg,
  }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          12.pWidth,
          Text(
            msg,
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    FToast().showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
