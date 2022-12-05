import 'package:flutter/material.dart';
import 'package:preferences_app/screens/widgets/widgets.dart';
import 'package:preferences_app/share_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  //
  static const String routeName = 'home';

  //

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkMode: ${Preferences.isDarkMode}'),
            const Divider(),
            Text('Género: ${Preferences.gender}'),
            const Divider(),
            Text('Nombre de Usuario: ${Preferences.name}'),
            const Divider(),
          ],
        ));
  }
}
