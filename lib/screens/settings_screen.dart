import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  //
  static const String routeName = 'Settings';

  //
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //

  // bool darkMode = false;
  // int gender = 1;
  // String name = 'Pedro';

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Ajustes'),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  value: Preferences.isDarkMode,
                  title: const Text('DarkMode'),
                  onChanged: (value) {
                    Preferences.isDarkMode = value;

                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);

                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLigthMode();
                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  title: const Text('Masculino'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;

                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  title: const Text('Femenino'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;

                    setState(() {});
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      label: Text('Nombre'),
                      helperText: 'Nombre de Usuario',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
