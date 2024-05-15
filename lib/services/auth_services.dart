import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginUser({
    required String email,
    required String password,
  }) {
    print("metodo login");
  }

  registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    await userCredential.user!.updateDisplayName(name);
  }
}
