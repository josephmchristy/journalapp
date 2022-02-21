import 'package:flutter/material.dart';

class UserPreferencesDrawer extends StatefulWidget {

  final void Function(bool) toggleTheme;

  const UserPreferencesDrawer({ Key? key, required this.toggleTheme }) : super(key: key);

  @override
  State<UserPreferencesDrawer> createState() => _UserPreferencesDrawerState();
}

class _UserPreferencesDrawerState extends State<UserPreferencesDrawer> {
  bool _isDarkTheme = false;
  Icon darkModeIcon = const Icon(Icons.dark_mode_outlined);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('User Preferences')
          ),
          SwitchListTile(
            title: const Text("Dark Theme"),
            value: _isDarkTheme, 
            onChanged: (toggle) {
              _isDarkTheme = toggle;
              if(_isDarkTheme) {
                darkModeIcon = const Icon(Icons.dark_mode);
              } else {
                darkModeIcon = const Icon(Icons.dark_mode_outlined);
              }
              widget.toggleTheme(_isDarkTheme);
            },
            secondary: darkModeIcon,
          )
        ],
      )
    );
  }
}