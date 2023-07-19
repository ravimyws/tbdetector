import 'package:flutter/material.dart';
import 'package:tbdetect/widgets/home/HomePage.dart';
import 'package:tbdetect/widgets/login/LoginForm.dart';
import 'package:tbdetect/widgets/login/LoginPage.dart';
import 'package:tbdetect/widgets/registration/RegistrationForm.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginPage(),
  '/login': (context) => LoginForm(),
  '/registration': (context) => RegistrationForm(),
  '/home': (context) => HomePage()
};
