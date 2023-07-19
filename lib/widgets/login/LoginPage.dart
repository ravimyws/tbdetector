import 'package:flutter/material.dart';
import '../registration/RegistrationForm.dart';
import './LoginForm.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add logo or app icon here if you have one

            SizedBox(height: 20),

            _buildLoginButton(context),
            _buildRegisterButton(context),
          ],
        ),
      ),
    );
  }

  void _navigateToLoginForm(BuildContext context) {
    /* Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginForm(),
      ),
    ); */
    Navigator.pushNamed(context, '/login');
  }

  void _navigateToRegistrationForm(BuildContext context) {
    /* Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationForm(),
      ),
    ); */

    Navigator.pushNamed(context, '/registration');
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateToLoginForm(context);
      },
      child: Text('Login'),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle register button click
        _navigateToRegistrationForm(context);
      },
      child: Text('Register'),
    );
  }
}
