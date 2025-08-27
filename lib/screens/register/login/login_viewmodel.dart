import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie/core/base.dart';
import 'package:movie/screens/register/login/connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector>{
login({required String email,required String password})async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
   connector!.goToHome();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      connector!.showErrorMessage(message: e.message);
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
}