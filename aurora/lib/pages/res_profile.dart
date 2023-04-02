import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String location = '';
  String dietPreference = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('PROFILE',),
        actions: const[],
        backgroundColor:const Color.fromARGB(255, 110, 212, 159),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Organiation Name',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter organisation name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Location',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your location',
              ),
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Dietary Preference',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Radio(
                  value: 'Vegetarian',
                  groupValue: dietPreference,
                  onChanged: (value) {
                    setState(() {
                      dietPreference = value.toString();
                    });
                  },
                ),
                const Text('Vegetarian'),
                const SizedBox(width: 16.0),
                Radio(
                  value: 'Non-vegetarian',
                  groupValue: dietPreference,
                  onChanged: (value) {
                    setState(() {
                      dietPreference = value.toString();
                    });
                  },
                ),
                const Text('Non-vegetarian'),
              ],
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(47, 155, 142, 1)),
                ),
                child: const Text('Save'),
                onPressed: () {
                  // Save profile information here
                   Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}