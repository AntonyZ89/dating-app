import 'package:dating_app/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final overlayStyle = SystemUiOverlayStyle.dark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        overlayStyle); // for pages without AppBar

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: overlayStyle, // for pages with AppBar
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      initialRoute: 'login',
      routes: {
        'chat': (context) => const ChatPage(),
        'home': (context) => const HomePage(),
        'login': (context) => const LoginPage(),
      },
    );
  }
}
