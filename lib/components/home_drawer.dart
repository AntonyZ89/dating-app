import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('login');
            },
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
