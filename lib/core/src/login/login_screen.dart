import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth/core/constants/constants.dart';
import 'package:user_auth/core/src/login/login_state.dart';
import 'package:user_auth/core/src/splash/splash.dart';
import 'package:user_auth/core/themes/themes.dart';
import 'package:user_auth/core/utils/extension/space_ext.dart';
import 'package:user_auth/core/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<LoginProvider>(context, listen: false).getContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return WillPopScope(
          onWillPop: () {
            return context.read<SplashProvider>().onWillPop();
          },
          child: Stack(
            children: [
              Scaffold(
                body: SafeArea(
                  child: Form(
                    key: provider.fromKey,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10.0),
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Image.asset(Assets.loginImage),
                          CustomTextFormField(
                            hinttext: "Username",
                            icon: Icons.person,
                            controller: provider.email,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                provider.fromKey.currentState!.validate();
                              }
                            },
                            validator: (email) {
                              return email!.isNotEmpty ? null : "* Required";
                            },
                            errorText: provider.userError,
                          ),
                          20.pHeight,
                          CustomTextFormField(
                            hinttext: "Password",
                            icon: Icons.password,
                            controller: provider.password,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                provider.fromKey.currentState!.validate();
                              }
                              setState(() {});
                            },
                            validator: (password) {
                              return password!.isNotEmpty ? null : "* Required";
                            },
                            errorText: provider.passError,
                            obscureText: provider.showPassword,
                            sufixIcon: provider.showPassword
                                ? IconButton(
                                    icon: Icon(Icons.visibility_off,
                                        color: errorColor),
                                    onPressed: () {
                                      provider.getShowPassword = false;
                                    })
                                : IconButton(
                                    icon: Icon(Icons.visibility,
                                        color: successColor),
                                    onPressed: () {
                                      provider.getShowPassword = true;
                                    }),
                          ),
                          30.pHeight,
                          ElevatedButton(
                            onPressed: () {
                              provider.onLogin();
                            },
                            child: const Text("LOGIN"),
                          ),
                          30.pHeight,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //
              if (provider.isLoading) LoadingScreen.loadingScreen(),
            ],
          ),
        );
      },
    );
  }
}
