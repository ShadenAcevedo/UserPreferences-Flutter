import 'package:datos_usuario/pages/home_page.dart';
import 'package:datos_usuario/pages/settings_page.dart';
import 'package:datos_usuario/share_prefs/user_preferences.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage()
      },
    );
  }
}
