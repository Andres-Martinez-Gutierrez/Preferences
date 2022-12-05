import 'package:flutter/material.dart';

import 'package:preferences_app/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const _DrawerHeder(),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Principal'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text('Usuarios'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_applications_sharp),
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeder extends StatelessWidget {
  const _DrawerHeder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
