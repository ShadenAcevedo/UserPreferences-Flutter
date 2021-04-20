
import 'package:datos_usuario/share_prefs/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datos_usuario/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool ?_colorSecundario;
  int ?_genero;
  String ?_nombre;

  TextEditingController ?_textController;
  final prefs = UserPreferences();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = TextEditingController(text: prefs.nombreUsuario);
  }

  _setValueRadio(int? valor) async{
    prefs.genero = valor!;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.deepOrangeAccent : Colors.purple,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
              value: _colorSecundario!,
              title: Text('Color secundario'),
              onChanged: (value){
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              }
          ),
          RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setValueRadio
          ),
          RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setValueRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona'
              ),
              onChanged: (value){
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      )
    );
  }
}
