import 'package:flutter/material.dart';
import 'basic_screen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Define test credentials
  final Map<String, Map<String, dynamic>> validCredentials = {
    'first': {
      'password': 'pass1',
      'name': 'Viviene Garcia',
      'email': 'vivs@gmail.com',
      'number': '0918-456-1232',
      'motto': 'Draw for a living',
      'education': {
        'elementary': 'SBC Batangas',
        'highschool': 'SBC Batangas',
        'seniorHigh': 'STI Batangas',
        'college': 'BSU (Current)',
      },
      'skills': [
        'Drawing',
        'Graphic Design',
        'Sleeping',
      ],
      'projects': [
        'Karipas:Batangas City Jeepney Transportation Web Application (Group Project)',
        'Pedagohiya: Classroom Management Application(Group Project)',
        'Invertrix: Visual Inverse Cipher Web Application (Group Project)',
      ],
      'experience': [
        'Digital Illustrator (Freelance): 2021/2024',
      ],
    },
    'second': {
      'password': 'pass2',
      'name': 'Grizzly Bear',
      'email': 'grizzy@gmail.com',
      'number': '0918-654-3212',
      'motto': 'Eat a lot of stuff',
      'education': {
        'elementary': 'Bear Elementary',
        'highschool': 'Forest High',
        'seniorHigh': 'Bear Academy',
        'college': 'Bear State University',
      },
      'skills': [
        'Problem Solving',
        'Forest Survival Techniques',
        'Leadership',
      ],
      'projects': [
        'House of the woods',
        'Chikitita',
        'I like to Play Poker: Coding System',
      ],
      'experience': [
        'Running 300miles',
        'Opening a Juicebox',
        'Playing Youtube',
      ],
    },
  };

  void _login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    // Check if username exists in the credentials and if the password matches
    if (validCredentials.containsKey(username) &&
        validCredentials[username]!['password'] == password) {
      // Navigate to BasicScreen with the correct details
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BasicScreen(
            name: validCredentials[username]!['name'],
            email: validCredentials[username]!['email'],
            number: validCredentials[username]!['number'],
            motto: validCredentials[username]!['motto'],
            education: validCredentials[username]!['education'],
            skills: validCredentials[username]!['skills'],
            projects: validCredentials[username]!['projects'],
            experience: validCredentials[username]!['experience'],
          ),
        ),
      );
    } else {
      // Show an error if the credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect username or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle,
                  size: 80, color: Color.fromARGB(255, 1, 5, 8)),
              Container(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Username',
                  ),
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
                obscureText: true,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
