import 'package:flutter/material.dart';
import 'package:portfolio/presentation/sign_up_scene/page/sign_up_page.dart';
import 'dependency_injector.dart';
import 'package:portfolio/presentation/login_scene/page/login_page.dart';

void main() {
  DependencyInjector.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }

}
