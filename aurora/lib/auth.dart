import 'package:firebase_auth/firebase_auth.dart';

class Auth{
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? get currentUser => _firebaseAuth.currentUser;
    Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
    
    //Signin with mail id and password
    Future<void> signInWithWmailAndPassword({
        required String email,
        required String password,
    }) async {
        await _firebaseAuth.signInWithEmailAndPassword(
            email:email,
            password:password,
        );
    }

    //create user
     Future<void> createUserWithWmailAndPassword({
        required String email,
        required String password,

    })async{
        await _firebaseAuth.createUserWithEmailAndPassword(
            email:email,
            password:password,
        );
    }

    //signout
    Future<void> signOut() async{
      await _firebaseAuth.signOut();
    }
}
