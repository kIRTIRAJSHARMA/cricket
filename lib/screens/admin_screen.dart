import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController team2Controller = TextEditingController();

  void createMatch() async {
    await FirebaseFirestore.instance.collection('matches').doc('current_match').set({
      'team1': team1Controller.text,
      'team2': team2Controller.text,
      'score1': 0,
      'score2': 0,
      'overs': 0,
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Match Created!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: team1Controller, decoration: const InputDecoration(labelText: "Team 1 Name")),
            TextField(controller: team2Controller, decoration: const InputDecoration(labelText: "Team 2 Name")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: createMatch, child: const Text("Create Match")),
          ],
        ),
      ),
    );
  }
}
