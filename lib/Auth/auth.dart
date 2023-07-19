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
  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseException catch (e){
  return e.message;
    }
    catch (e){}


  }

  getCurrentUser() async {
    _auth.currentUser;
  }
  Future<String?>recoverPassword(String email) async  {
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return "Email enviado";
    }
    on FirebaseException catch (e){
      if (e.code == "user-not-found"){
        return "Usuario nao encontrado";
      }
    }
    catch (e){
      return "Usuario nao encontrado";
    }
  }
}
