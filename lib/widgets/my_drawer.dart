import 'package:flutter/material.dart';
import 'package:zstory/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    //get auth service
    final auth = AuthService();
    // log out
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: Icon(
                  Icons.person,
                  size: 120,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              // chat tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.chat,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('C H A T'),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              // profile tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('P R O F I L E'),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);
                    // navigate to profile page
                    Navigator.pushNamed(context, '/profile_page');
                  },
                ),
              ),

              // users tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.group,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('S T O R Y'),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);
                    // navigate to story page
                    Navigator.pushNamed(context, '/story_page');
                  },
                ),
              ),
            ],
          ),

          // logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text('L O G O U T'),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
