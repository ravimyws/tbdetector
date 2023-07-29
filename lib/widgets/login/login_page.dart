import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../providers/google_sign_in_provider.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignInProvider _googleSignInProvider = GoogleSignInProvider();
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
            _buildGoogleSignInButton(context),
          ],
        ),
      ),
    );
  }

  void _navigateToLoginForm(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void _navigateToRegistrationForm(BuildContext context) {
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

  Widget _buildGoogleSignInButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final navigator = Navigator.of(context);
        User? user = await _googleSignInProvider.signInWithGoogle();
        print(user);

        if (user != null) {
          // Handle successful sign-in
          print('Signed in as: ${user.displayName}');

          navigator.pushReplacementNamed('/home');
        } else {
          // Handle sign-in failure
          print('Sign-in failed.');
        }
      },
      child: Text('Sign in with Google'),
    );
  }
}
