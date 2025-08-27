import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie/screens/register/sign_up/connector.dart';

import '../../../models/user_request.dart';

class SignUpViewModel {
  SignUP({
    required UserRequest user,
    required String password,
    required Function onError,
    required Function onSuccess,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      onError(e.message??" ");
      } else if (e.code == 'email-already-in-use') {
       onError("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }
}
