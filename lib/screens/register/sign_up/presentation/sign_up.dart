import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/register/sign_up/data/user_request.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/register/sign_up/domain/signup_viewModel.dart';
import '../data/avater_model.dart';
import '../../../widgets/avatar_gallery.dart';
import '../../login/presentation/screens/login_screen.dart';

class SignUPScreen extends StatefulWidget {
  static const String routeName = "SignUp";

  SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final List<Avatar> avatars = [
    Avatar(id: 'a1', image: 'assets/images/avatar1.png'),
    Avatar(id: 'a2', image: 'assets/images/avatar2.png'),
    Avatar(id: 'a3', image: 'assets/images/avatar3.png'),
    Avatar(id: 'a4', image: 'assets/images/avatar4.png'),
    Avatar(id: 'a5', image: 'assets/images/avatar5.png'),
    Avatar(id: 'a6', image: 'assets/images/avatar6.png'),
    Avatar(id: 'a7', image: 'assets/images/avatar7.png'),
    Avatar(id: 'a8', image: 'assets/images/avatar8.png'),
    Avatar(id: 'a9', image: 'assets/images/avatar9.png'),
  ];

  String? selectedAvatarId;

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = SignUpViewModel();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "register".tr(),
            style: TextStyle(color: Color(0xFFF6BD00)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              AvatarGallery(
                avatars: avatars,
                selectedId: selectedAvatarId,
                onSelected: (id) => setState(() => selectedAvatarId = id),
              ),
              SizedBox(height: 24),
              TextFormField(
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
                    "name".tr(),
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
                    "phone".tr(),
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
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is Required";
                  }
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail\.com$",
                  ).hasMatch(value);
                  if (emailValid == false) {
                    return "Email is Not Valid";
                  }
                  return null;
                },
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
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is Required";
                  }
                  if (value.length < 6) {
                    return "Password is Weak";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF282A28),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white),
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
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Re Password is Required";
                  }
                  if (value != passwordController.text) {
                    return "Password Not Match";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF282A28),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white),
                  label: Text(
                    "re_password".tr(),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 60),
                  backgroundColor: Color(0xFFF6BD00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    UserRequest user = UserRequest(
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                      " ",
                    );
                    signUpViewModel.SignUP(
                        user: user,
                        password: passwordController.text, onError:(message){

                      showDialog(
                        context: context, builder: (context) =>
                          AlertDialog(
                            backgroundColor: Colors.blueGrey,
                            title: Text("Error", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            content: Text(
                              message, style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),
                            actions: [
                              ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text("Okay", style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                              )
                            ],
                          ),);
                    },onSuccess:(){
                          Navigator.pushNamed(context, HomeScreen.routeName);
                    }

                  ,
                  );
                }
                },
                child: Text(
                  "create_account".tr(),
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
                      text: "already_have_one?".tr(),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      text: "login".tr(),
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
              SizedBox(height: 24),
              Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Color(0xFFF6BD00), width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.setLocale(Locale('en'));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(
                            color: Color(0xFFF6BD00),
                            width: 5,
                            style: context.locale.toString() == "en"
                                ? BorderStyle.solid
                                : BorderStyle.none,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/am.png",
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.setLocale(Locale('ar'));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(
                            color: Color(0xFFF6BD00),
                            width: 5,
                            style: context.locale.toString() == "ar"
                                ? BorderStyle.solid
                                : BorderStyle.none,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/eg.png",
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
