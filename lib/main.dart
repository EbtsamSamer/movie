import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/onboarding/on_boarding.dart';
import 'package:movie/screens/register/login/presentation/forget_password_screen.dart';
import 'package:movie/screens/register/login/presentation/login_screen.dart';
import 'package:movie/screens/register/sign_up/presentation/sign_up.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
      child: MyApp()));
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName:(_)=>OnboardingScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        SignUPScreen.routeName:(_)=>SignUPScreen(),
        ForgetPasswordScreen.routeName:(_)=>ForgetPasswordScreen(),

      },
    );
  }
}
