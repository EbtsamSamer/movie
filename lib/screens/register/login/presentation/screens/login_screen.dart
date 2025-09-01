import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/register/login/presentation/bloc/login_bloc.dart';
import 'package:movie/screens/register/login/presentation/screens/forget_password_screen.dart';
import 'package:movie/screens/register/sign_up/presentation/sign_up.dart';
import '../../../../home/home_screen.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.requestState == RequestState.success) {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 68),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/ic_splash.png",
                        fit: BoxFit.fill,
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF282A28),
                        prefixIcon: ImageIcon(
                          AssetImage("assets/images/email_ic.png"),
                          color: Colors.white,
                        ),
                        label: Text(
                          "email".tr(),
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF282A28),
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        suffixIcon: Icon(
                            Icons.remove_red_eye, color: Colors.white),
                        label: Text(
                          "password".tr(),
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ForgetPasswordScreen.routeName);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "forget_password?".tr(),
                          style: GoogleFonts.inter(
                            color: Color(0xFFF6BD00),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(400, 60),
                        backgroundColor: Color(0xFFF6BD00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(SignInRequested(
                            emailController.text, passwordController.text));
                        // context.read<LoginBloc>().add(SignInRequested(
                        //   emailController.text,
                        //   passwordController.text,
                        // ));
                      },
                      child: Text(
                        "login".tr(),
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "don't_have_account?".tr(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, SignUPScreen.routeName);
                              },
                            text: "create_one".tr(),
                            style: GoogleFonts.inter(
                              decoration: TextDecoration.underline,
                              color: Color(0xFFF6BD00),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color(0xFFF6BD00),
                              indent: 20,
                              endIndent: 24,
                            ),
                          ),
                          Text(
                            "or".tr(),
                            style: GoogleFonts.inter(
                              color: Color(0xFFF6BD00),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              indent: 24,
                              endIndent: 32,
                              color: Color(0xFFF6BD00),
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(400, 60),
                        backgroundColor: Color(0xFFF6BD00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        // تفعيل تسجيل الدخول بجوجل إن لزمك
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/google_ic.png"),
                            color: Colors.black,
                          ),
                          SizedBox(width: 7),
                          Text(
                            "login_with_google".tr(),
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              )
              ,
            );
          },
        )
    );
  }
}