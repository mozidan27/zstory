import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zstory/services/auth/auth_services.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
// get auth services
  final AuthService _authService = AuthService();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    final currentUser = _authService.getCurrentUser()!;
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = _authService.getCurrentUser()!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // error
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error :${snapshot.error}'),
            );
          }

          //data receive
          else if (snapshot.hasData) {
            // extract data
            Map<String, dynamic>? user = snapshot.data!.data(); // user data
            return Column(
              children: [
                Text(user!['email'] ?? 'No email'), // email
                Text(user['username'] ?? 'No username'), // username
              ],
            );
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }
}
