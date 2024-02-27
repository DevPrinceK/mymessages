import 'package:flutter/material.dart';
import 'package:mymessages/constants.dart/colors.dart';
import 'package:mymessages/screens/pages/home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
        backgroundColor: primaryColor300,
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Welcome to MyMessages',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: primaryColor900),
                ),
                const Text(
                  'Build up your faith with the undeniable word of God as preached by Professor Yaokumah!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor300,
                    foregroundColor: Colors.white,
                    shadowColor: primaryColor900,
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text('Get Started'),
                ),
              ],
            ),
          );
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg/prayinghand.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
