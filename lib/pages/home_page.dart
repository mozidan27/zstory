import 'package:flutter/material.dart';
import 'package:zstory/auth/auth_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // logout method

  void logout() {
    //get auth service
    final auth = AuthService();

    // log out
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
