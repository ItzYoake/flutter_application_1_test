import 'package:flutter/material.dart';
import 'screens/food-selection.dart'; // Import the FoodSelectionPage

void main() {
  runApp(NutriDietApp());
}

class NutriDietApp extends StatelessWidget {
  const NutriDietApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriDiet',
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Image.asset('assets/logo.png', height: 100),
              const SizedBox(height: 20),

              // Email Field
              const TextField(
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 10),

              // Forgot Password Text
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),

              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to FoodSelectionPage after login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodSelectionPage(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 20),

              // Social Login Options
              const Text('Or Sign in with'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.network(
                      'https://img.icons8.com/color/48/000000/google-logo.png',
                    ),
                    onPressed: () {
                      // Handle Google login
                    },
                  ),
                  IconButton(
                    icon: Image.network(
                      'https://img.icons8.com/fluency/48/000000/instagram-new.png',
                    ),
                    onPressed: () {
                      // Handle Instagram login
                    },
                  ),
                  IconButton(
                    icon: Image.network(
                      'https://img.icons8.com/color/48/000000/facebook-new.png',
                    ),
                    onPressed: () {
                      // Handle Facebook login
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Register Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      // Navigate to Register Page
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
