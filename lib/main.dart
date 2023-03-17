import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/landing_page/landing_page.dart';
import 'app/services/auth.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391

  await Firebase.initializeApp();
  runApp(const IAmHappyApp());
}

class IAmHappyApp extends StatelessWidget {
  const IAmHappyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
