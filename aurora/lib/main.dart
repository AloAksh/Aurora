import 'package:firebase_core/firebase_core.dart';
import 'package:aurora/pages/pages.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aurora',
      //home: const Loading(),
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 110, 212, 159),
      ),
      routes:{
        '/': (context) => const Loading(),
        '/login': (context) => const LogIn(),
        '/chooseOpt': (context) => const ChooseOption(),
        '/char_profile': (context) => const CharProfile(),
        '/donateDet': (context) => const DonateDet(),
        '/done': (context) => const Done(),
        '/home': (context) => const Home(),
        '/pickup': (context) => const PickUp(),
        '/res_profile': (context) => const Profile(),

      },
    );
  }
}