import 'package:flutter/material.dart';

class UserPreferencesDrawer extends StatelessWidget {
  const UserPreferencesDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text('User Preferences')
          ),
        ],
      )
    );
  }
}