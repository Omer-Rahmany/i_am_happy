import 'package:flutter/material.dart';
import 'package:i_am_happy/app/services/auth.dart';
import 'package:i_am_happy/app/sign_in_page/social_sign_in_button.dart';

import '../common_widgets/vertical_spacer.dart';
import 'sign_in_button.dart';

class SignInPage extends StatelessWidget {
  final AuthBase auth;
  const SignInPage({
    super.key,
    required this.auth,
  });

  Future<void> signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpacer(height: 43.0),
            SocialSignInButton(
              text: "Sign in with google",
              onPressed: signInWithGoogle,
              imagePath: "images/google-logo.png",
            ),
            const VerticalSpacer(height: 8.0),
            SignInButton(
              text: "Sign in Anonymously",
              onPressed: signInAnonymously,
            )
          ],
        ),
      ),
    );
  }
}
