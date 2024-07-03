import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zstory/services/auth/auth_services.dart';
import 'package:zstory/widgets/my_back_button.dart';

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
            return Center(
              child: Column(
                children: [
                  //back button
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyBackButton(
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  // images
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(30),
                    child: const Icon(
                      Icons.person,
                      size: 66,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // user name
                  Text(
                    user!['username'] ?? 'No username',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  // email
                  Text(
                    user['email'] ?? 'No email',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
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
