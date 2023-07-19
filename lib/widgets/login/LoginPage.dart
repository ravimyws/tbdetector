import 'package:flutter/material.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Container(),
      ),
    );
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
      },
      child: Text('Register'),
    );
  }
}
