import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<User> createUser(String email, String password) async {
    final user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user;

    return user!;
  }
}
