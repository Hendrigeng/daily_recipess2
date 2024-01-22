import 'package:flutter/material.dart';
import 'dart:async';
import 'package:daily_recipes2/pages/homepage.dart';
import 'package:daily_recipes2/pages/Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/preferences.services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  StreamSubscription<User?>? _listener;
  @override
  void initState() {
    initSplash();
    super.initState();
  }
  void initSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    _listener = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Login()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/images/logo.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("Assets/images/logo2.png"),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
