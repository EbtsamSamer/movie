import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/models/user_request.dart';

class UserProvider extends ChangeNotifier{
  User? firebaseUser;
 UserRequest ? userRequester;
  UserProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    // if(firebaseUser!=null){
    //   initUser();
    // }
  }
  // initUser()async{
  //
  //   userModel=await FirebaseManager.readUserData();
  //   notifyListeners();
  // }
  clearData(){
    userRequester=null;
    firebaseUser=null;
    notifyListeners();
  }
}