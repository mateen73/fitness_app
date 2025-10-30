import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_colors.dart';
import '../models/program_model.dart';
import '../core/widgets/custom_card.dart';
import '../core/widgets/loading_widget.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({super.key});

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  late Future<List<Program>> programsFuture;

  @override
  void initState() {
    super.initState();
    programsFuture = loadPrograms();
  }

  Future<List<Program>> loadPrograms() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final String data = await rootBundle.loadString('lib/api/mock_data.json');
    final List jsonList = json.decode(data);
    return jsonList.map((e) => Program.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Programs'), backgroundColor: AppColors.primary),
      body: FutureBuilder<List<Program>>(
        future: programsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
          }
          if (!snapshot.hasData) return const LoadingWidget();

          final programs = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final p = programs[index];
              return CustomCard(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(p.thumbnail, width: 70, height: 70, fit: BoxFit.cover),
                  ),
                  title: Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${p.instructor} • ${p.duration}', style: TextStyle(color: AppColors.textLight)),
                  trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
                  onTap: () => Navigator.pushNamed(context, '/detail', arguments: p),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Navigator.pushNamed(context, '/feedback'),
        child: const Icon(Icons.feedback, color: Colors.white),
      ),
    );
  }
}