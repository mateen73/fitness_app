import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/program_model.dart';
import '../core/constants/app_colors.dart';

class ProgramDetailScreen extends StatelessWidget {
  const ProgramDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Program program = ModalRoute.of(context)!.settings.arguments as Program;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(program.thumbnail, fit: BoxFit.cover),
            ),
            backgroundColor: AppColors.primary,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(program.title, style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(Icons.person, size: 18, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(program.instructor, style: const TextStyle(fontSize: 16, color: AppColors.primary)),
                    const Spacer(),
                    const Icon(Icons.access_time, size: 18, color: AppColors.textLight),
                    const SizedBox(width: 4),
                    Text(program.duration, style: const TextStyle(color: AppColors.textLight)),
                  ]),
                  const Divider(height: 32),
                  Text(program.description, style: const TextStyle(fontSize: 16, height: 1.6, color: AppColors.textDark)),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_circle_fill),
                      label: const Text('Start Workout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}