
import 'package:remote_lamp/auth/login.dart';
import 'package:remote_lamp/auth/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(clickSignUp: toggle)
      : RegisterScreen(clickSignIn: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
