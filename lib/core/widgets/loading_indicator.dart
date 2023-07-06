import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_auth/core/themes/themes.dart';

class LoadingScreen {
  static Widget loadingScreen() {
    return Platform.isAndroid
        ? SafeArea(
            child: Stack(
              children: [
                Container(color: Colors.black.withAlpha(100)),
                const LinearProgressIndicator(
                  color: primaryColor,
                ),
              ],
            ),
          )

        ///
        : SafeArea(
            child: Stack(
              children: [
                Container(color: Colors.black.withAlpha(100)),
                const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
  }
}


/// 
