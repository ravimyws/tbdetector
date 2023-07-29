import 'package:flutter/material.dart';
import 'package:tbdetect/widgets/home/home_page.dart';
import 'package:tbdetect/widgets/home/home_response.dart';
import 'package:tbdetect/widgets/login/login_form.dart';
import 'package:tbdetect/widgets/login/login_page.dart';
import 'package:tbdetect/widgets/registration/registration_form.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginPage(),
  '/login': (context) => LoginForm(),
  '/registration': (context) => RegistrationForm(),
  '/home': (context) => HomePage(),
  '/home/response': (context) =>
      HomeResponsePage(), // pass an empty string as the required argument
};
