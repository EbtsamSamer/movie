import 'package:flutter/material.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/onboarding/on_boarding.dart';
import 'package:movie/screens/register/login/login_screen.dart';
import 'package:movie/screens/register/sign_up/sign_up.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        OnboardingScreen.routeName:(_)=>OnboardingScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        SignUPScreen.routeName:(_)=>SignUPScreen(),
      },
    );
  }
}
