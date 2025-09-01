import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/onboarding/presentation/on_boarding.dart';

class UpdateProfile extends StatelessWidget {
  static const String routeName = "UpdateProfile";

  UpdateProfile({super.key});
var nameController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFFBB3B)),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Pick Avatar",
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFFF6BD00),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(8),
            width: 150,
            height: 150,
            child: Image.asset(
              "assets/images/avatar2.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 24),
          TextFormField(
            style: TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name is Required";
              }
              return null;
            },
            controller: nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF282A28),
              prefixIcon: Icon(Icons.person, color: Colors.white),
              label: Text(
                "name",
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone is Required";
              } else if (value.length != 11) {
                return "Phone Not Valid";
              }
              return null;
            },
            controller: phoneController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF282A28),
              prefixIcon: Icon(Icons.call, color: Colors.white),
              label: Text(
                "phone",
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Reset Password",style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,

            ),),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(400, 60),
              backgroundColor: Color(0xFFE82626),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                OnboardingScreen.routeName,
                    (route) => false,
              );
            },
            child: Text(
              "Delete Account",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 26),
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
              "Update Data",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

        ],),
      ),
    );
  }
}
