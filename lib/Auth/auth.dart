import 'package:firebase_auth/firebase_auth.dart' hide UserCredential;

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //criarcontaemailesenha
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print(user);
    //salvar no banco de dados depois.
  }

  //loginemailesenha
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  getCurrentUser() async {
    _auth.currentUser;
  }

  recoverPassword(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }
}
