import 'package:flutter/material.dart';
import 'package:route_flutter/screens/home_screen.dart';
import 'package:route_flutter/screens/login_screen.dart';
import 'package:route_flutter/screens/lupapassword_screen.dart';
import 'package:route_flutter/screens/profile_screen.dart';
import 'package:route_flutter/screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/lppassword': (context) => LupapasswordScreen(),
      },
    );
  }
}
