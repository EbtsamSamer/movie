import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/register/sign_up/sign_up.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF282A28),
                prefixIcon: ImageIcon(
                  AssetImage("assets/images/email_ic.png"),
                  color: Colors.white,
                ),
                label: Text(
                  "Email",
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

              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF282A28),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: Icon(Icons.remove_red_eye,color: Colors.white,),
                label: Text(
                  "Password",
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
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: GoogleFonts.inter(
                  color: Color(0xFFF6BD00),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
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
              },
              child: Text(
                "Login",
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
                    text: "Don’t Have Account ? ",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, SignUPScreen.routeName);
                      },
                    text: "Create One",
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
                  child: Divider(color: Color(0xFFF6BD00), indent: 20, endIndent: 24),
                ),
                Text(
                  "Or",
                  style: GoogleFonts.inter(
                    color: Color(0xFFF6BD00),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Divider(indent: 24, endIndent: 32, color: Color(0xFFF6BD00)),
                ),
              ],
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
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage("assets/images/google_ic.png")),
                  SizedBox(width: 7),
                  Text(
                    "Login With Google",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
