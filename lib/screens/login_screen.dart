import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  void seConnecter() {
    if (usernameController.text == "admin" &&
        passwordController.text == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Identifiants incorrects",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.indigo,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(20),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(25),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min,
                  children: [
                   Image.asset(
                    'assets/images/logo.jpg',
                    height: 120,
                   ),

                    const SizedBox(height: 10),

                    const Text(
                      "MyNotes",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    TextField(
                      controller:
                          usernameController,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Nom d'utilisateur",
                        prefixIcon:
                            Icon(Icons.person),
                        border:
                            OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller:
                          passwordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Mot de passe",
                        prefixIcon:
                            Icon(Icons.lock),
                        border:
                            OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width:
                          double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            seConnecter,
                        child: const Text(
                          "Se connecter",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}