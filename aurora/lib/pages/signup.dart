import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser {
  final String? uid ;
  final String? code; //code firebaseauth excemption
  FirebaseUser({this.uid,this.code});
}

class LoginUser {
  final String? email;
  final String? password;

  LoginUser({this.email, this.password});
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _obscureText = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 110, 212, 159),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up to continue',
                  style: TextStyle(fontSize: 30),
                )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                child: TextFormField(
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Email id',
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                child: TextFormField(
                  controller: _email,
                decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Enter your password',
                suffixIcon: IconButton(icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: (){
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }
                ),
                ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: _password,
                  autofocus: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    if (value.trim().length < 8) {
                      return 'Password must be at least 8 characters in length';
                    }
                  // Return null if the entered password is valid
                    return null;
                  } ,
                decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Confirm your password',
                suffixIcon: IconButton(icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: (){
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }
                ),
                ),
                ),
               ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(47, 155, 142, 1)),
                ),
                onPressed: ()
                {
                  
                  Navigator.pushNamed(context, '/chooseOpt');
                },
                child: const Padding(
                    padding: EdgeInsets.all(15),
                    child:Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                    
                    ),
                )
                
              ),
              ),
            ]
          )
         ),
    );
  }
}



class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  FirebaseUser? _firebaseUser(User? user) {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }


  Stream<FirebaseUser?> get user {
    return _auth.authStateChanges().map(_firebaseUser);
  }


  Future signInAnonymous() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _firebaseUser(user);
    } catch (e) {
     return FirebaseUser(code: e.toString(), uid: null);
    }
  }


  Future signInEmailPassword(LoginUser _login) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _login.email.toString(),
              password: _login.password.toString());
      User? user = userCredential.user;
      return _firebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return FirebaseUser(code: e.code, uid: null);
    }
  }


  Future registerEmailPassword(LoginUser _login) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _login.email.toString(),
              password: _login.password.toString());
      User? user = userCredential.user;
      return _firebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return FirebaseUser(code: e.code, uid: null);
    } catch (e) {
      return FirebaseUser(code: e.toString(), uid: null);
    }
  }


  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}