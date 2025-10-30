import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 24),
            Text('Thank You!', style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold)),
            const Text('Your feedback has been submitted.'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}