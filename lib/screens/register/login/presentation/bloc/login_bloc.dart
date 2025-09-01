import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginBloc() : super(AuthInitial()) {
    on<SignInRequested>(_onSignIn);
    on<SignOutRequested>(_onSignOut);
  }

  Future<void> _onSignIn(SignInRequested event, Emitter<LoginState> emit) async {
    emit(AuthLoading());
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final user = cred.user;
      if (user != null) {
        emit(AuthSuccess(user.email ?? ''));
      } else {
        emit(AuthFailure('Unknown error'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Login failed'));
    } catch (e) {
      emit(AuthFailure('An error occurred'));
    }
  }

  Future<void> _onSignOut(SignOutRequested event, Emitter<LoginState> emit) async {
    await _auth.signOut();
    emit(AuthInitial());
  }
}