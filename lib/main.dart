import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fitness_app/screens/feedback_form_screen.dart';
import 'package:my_fitness_app/screens/program_list_screen.dart';
import 'screens/home_screen.dart';

import 'screens/program_detail_screen.dart';

import 'screens/success_screen.dart';

void main() => runApp(const FitnessProApp());

class FitnessProApp extends StatelessWidget {
  const FitnessProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'FitPro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/programs': (_) => const ProgramsScreen(),
        '/detail': (_) => const ProgramDetailScreen(),
        '/feedback': (_) => const FeedbackScreen(),
        '/success': (_) => const SuccessScreen(),
      },
    );
  }
}