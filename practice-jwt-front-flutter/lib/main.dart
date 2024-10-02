import 'package:flutter/material.dart';
import 'dependency_injector.dart';  // 의존성 관리 객체 import
import 'package:portfolio/presentation/login_scene/page/login_page.dart';

void main() {
  DependencyInjector.setup();  // 의존성 주입 설정

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
      home: const LoginPage(),
    );
  }
}
