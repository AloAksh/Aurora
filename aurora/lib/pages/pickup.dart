import "package:aurora/pages/pages.dart";
import "package:flutter/material.dart";

class PickUp extends StatelessWidget {
  const PickUp({super.key});

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
                  'PICKUP PERSONNAL DETAILS',
                  style: TextStyle(fontSize: 30),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name:',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Contact:',
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Estimated Pickup time:',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'OTP:',
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Done()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'DONE',
                      style: TextStyle(fontSize: 20),
                    ),
                   
                  )),
            ),
            ])),
    );
  }
}