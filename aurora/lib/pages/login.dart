import "package:aurora/pages/pages.dart";
import "package:flutter/material.dart";

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final mail = TextEditingController();
  final passwrd = TextEditingController();

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
                  'Sign in to continue',
                  style: TextStyle(fontSize: 30),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                controller: mail,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your Email id',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                controller: passwrd,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(47, 155, 142, 1)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/chooseOpt');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                )
              ],
            ),
          ])),
    );
  }
}



