import 'package:bybus/theme/theme_provider.dart';
import 'package:bybus/view/add_funds_page.dart';
import 'package:bybus/view/config_page.dart';
import 'package:bybus/view/home_login_page.dart';
import 'package:bybus/view/home_page.dart';
import 'package:bybus/view/login_page.dart';
import 'package:bybus/view/map_page.dart';
import 'package:bybus/view/register_page.dart';
import 'package:bybus/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const ConfigPage(),
      routes: <String, WidgetBuilder>{
        '/homeloginpage': (BuildContext context) => const HomeLoginPage(),
        '/loginpage': (BuildContext context) => const LoginPage(),
        '/registerpage': (BuildContext context) => const RegisterPage(),
        '/userpage': (BuildContext context) => const UserPage(),
        '/configpage': (BuildContext context) => const ConfigPage(),
        '/homepage': (BuildContext context) => const HomePage(),
        '/mappage': (BuildContext context) => const MapPage(),
        '/addfundspage': (BuildContext context) => const AddFundsPage(),
      },
    );
  }
}
