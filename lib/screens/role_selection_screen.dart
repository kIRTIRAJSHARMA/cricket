import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'admin_screen.dart';
import 'operator_screen.dart';
import 'viewer_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  final String userId;

  const RoleSelectionScreen(this.userId, {super.key});

  void selectRole(BuildContext context, String role) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({'role': role});

    if (role == "admin") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminScreen()));
    } else if (role == "operator") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OperatorScreen()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewerScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Your Role")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => selectRole(context, "admin"),
              child: const Text("Admin"),
            ),
            ElevatedButton(
              onPressed: () => selectRole(context, "operator"),
              child: const Text("Operator"),
            ),
            ElevatedButton(
              onPressed: () => selectRole(context, "viewer"),
              child: const Text("Viewer"),
            ),
          ],
        ),
      ),
    );
  }
}
