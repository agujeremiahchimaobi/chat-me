import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chat/services/database_service.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Register
  Future registerUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User? user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        await DatabaseService(uId: user.uid).createUserData(email, fullName);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e;
    }
  }
}
