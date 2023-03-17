import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_am_happy/app/services/auth.dart';
import 'package:i_am_happy/app/sign_in_page/sign_in_page.dart';

import '../home_page/home_page.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;
  const LandingPage({
    super.key,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomePage(
              auth: auth,
            );
          }
          return SignInPage(
            auth: auth,
          );
        }
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}
