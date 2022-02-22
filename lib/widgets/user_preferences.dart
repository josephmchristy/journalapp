import 'package:flutter/material.dart';
import 'package:journalapp/app.dart';

class UserPreferencesDrawer extends StatefulWidget {

  final void Function(bool) toggleTheme;

  const UserPreferencesDrawer({ Key? key, required this.toggleTheme }) : super(key: key);

  @override
  State<UserPreferencesDrawer> createState() => _UserPreferencesDrawerState();
}

class _UserPreferencesDrawerState extends State<UserPreferencesDrawer> {
  

  @override
  Widget build(BuildContext context) {

    AppState? appState = context.findAncestorStateOfType<AppState>();

    bool _isDarkTheme = appState!.isDarkTheme;
    Icon darkModeIcon = const Icon(Icons.dark_mode);
    if(!_isDarkTheme) darkModeIcon = const Icon(Icons.dark_mode_outlined);

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