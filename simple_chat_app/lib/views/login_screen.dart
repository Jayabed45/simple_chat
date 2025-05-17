import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'chat_screen.dart';

class LoginScreen extends StatelessWidget {
  final _authController = AuthController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.forum_rounded,
                size: 100,
                color: Colors.tealAccent,
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome to ChatWave',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                icon: const Icon(Icons.person_outline),
                label: const Text('Continue as Guest'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  await _authController.signInAnonymously();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ChatScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
