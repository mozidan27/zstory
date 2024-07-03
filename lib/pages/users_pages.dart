import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zstory/helper/helper_functions.dart';

class UsersPages extends StatelessWidget {
  const UsersPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('users page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // error
          else if (snapshot.hasError) {
            displayMessageToUser('something went wrong', context);
          }

          // empty
          if (snapshot.data == null) {
            return const Center(
              child: Text('No Data'),
            );
          }
          // recieve data
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              // get individual user
              final user = users[index];

              // display the usersz
              // display the users
              String username = user.data().containsKey('username')
                  ? user['username']
                  : 'No username';
              String email =
                  user.data().containsKey('email') ? user['email'] : 'No email';
              return ListTile(
                title: Text(username),
                subtitle: Text(email),
              );
            },
          );
        },
      ),
    );
  }
}
