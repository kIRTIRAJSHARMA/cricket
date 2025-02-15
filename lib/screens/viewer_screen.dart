import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewerScreen extends StatelessWidget {
  const ViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Match Score")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('matches').doc('current_match').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          var matchData = snapshot.data!;
          return Center(
            child: Text("${matchData['team1']} ${matchData['score1']} - ${matchData['team2']} ${matchData['score2']}"),
          );
        },
      ),
    );
  }
}
