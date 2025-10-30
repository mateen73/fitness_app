import 'package:flutter/material.dart';
import '../core/widgets/gradient_button.dart';
import '../core/utilis/validators.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _loading = false);
    Navigator.pushNamedAndRemoveUntil(context, '/success', (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(controller: _nameCtrl, decoration: _inputDec('Full Name'), validator: Validators.name),
            const SizedBox(height: 16),
            TextFormField(controller: _emailCtrl, decoration: _inputDec('Email'), keyboardType: TextInputType.emailAddress, validator: Validators.email),
            const SizedBox(height: 16),
            TextFormField(controller: _passCtrl, decoration: _inputDec('Password (8+ chars)'), obscureText: true, validator: Validators.password),
            const SizedBox(height: 32),
            GradientButton(text: 'Submit Feedback', onPressed: _submit, loading: _loading),
          ]),
        ),
      ),
    );
  }

  InputDecoration _inputDec(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    filled: true,
    fillColor: Colors.grey[50],
  );
}