import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OperatorScreen extends StatelessWidget {
  const OperatorScreen({super.key});

  void updateScore(String team, int runs) async {
    DocumentReference matchRef = FirebaseFirestore.instance.collection('matches').doc('current_match');
    DocumentSnapshot matchData = await matchRef.get();

    if (matchData.exists) {
      int newScore = (matchData[team] ?? 0) + runs;
      matchRef.update({team: newScore});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Operator Panel")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('matches').doc('current_match').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          var matchData = snapshot.data!;
          int score1 = matchData['score1'] ?? 0;
          int score2 = matchData['score2'] ?? 0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Team 1 Score: $score1", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => updateScore('score1', 1), child: const Text("+1")),
                  ElevatedButton(onPressed: () => updateScore('score1', 4), child: const Text("+4")),
                  ElevatedButton(onPressed: () => updateScore('score1', 5), child: const Text("+5")),
                  ElevatedButton(onPressed: () => updateScore('score1', 6), child: const Text("+6")),
                ],
              ),
              const SizedBox(height: 20),
              Text("Team 2 Score: $score2", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => updateScore('score2', 1), child: const Text("+1")),
                  ElevatedButton(onPressed: () => updateScore('score2', 4), child: const Text("+4")),
                  ElevatedButton(onPressed: () => updateScore('score2', 5), child: const Text("+5")),
                  ElevatedButton(onPressed: () => updateScore('score2', 6), child: const Text("+6")),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
