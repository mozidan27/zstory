import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zstory/helper/helper_functions.dart';
import 'package:zstory/widgets/my_back_button.dart';

class UsersPages extends StatelessWidget {
  const UsersPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
          return Column(
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

              // list of users exites
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    // get individual user
                    final user = users[index];

                    // display the usersz
                    // display the users
                    String username = user.data().containsKey('username')
                        ? user['username']
                        : 'No username';
                    String email = user.data().containsKey('email')
                        ? user['email']
                        : 'No email';
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primary),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(username),
                                subtitle: Text(email),
                              ),
                            ),
                            // user image
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 32,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
