import 'package:flutter/material.dart';

import 'checkboxclass.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'checkbox',
    home: MycheckboxApp(),
  ));
}

class MycheckboxApp extends StatefulWidget {
  const MycheckboxApp({Key? key}) : super(key: key);

  @override
  _MycheckboxAppState createState() => _MycheckboxAppState();
}

class _MycheckboxAppState extends State<MycheckboxApp> {
  bool value = false;
  CheckboxSettings _checkboxSettings = CheckboxSettings(title: 'Check All');

  final notifications = [
    CheckboxSettings(title: 'Ali vai'),
    CheckboxSettings(title: 'Jahangir vai'),
    CheckboxSettings(title: 'Mehedi vai'),
    CheckboxSettings(title: 'Sompod vai'),
    CheckboxSettings(title: 'Deluar nai'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          buildMasterCheckbox(_checkboxSettings),
          ...notifications.map(buildSingleCheckbox).toList(),
        ],
      ),
    );
  }

  Widget buildMasterCheckbox(CheckboxSettings _checkboxSettings) =>
      buildCheckbox(
        checkboxSettings: _checkboxSettings,
        voidCallback: () {
          setState(() {
            final newValue = !_checkboxSettings.value;
            _checkboxSettings.value = newValue;

            notifications.forEach((_checkboxNotification) {
              _checkboxNotification.value = newValue;
            });
          });
        },
      );

  Widget buildSingleCheckbox(CheckboxSettings checkboxSettings) =>
      buildCheckbox(
          checkboxSettings: checkboxSettings,
          voidCallback: () {
            setState(() {
              final newValue = !checkboxSettings.value;
              checkboxSettings.value = newValue;
            });
          });
  Widget buildCheckbox({
    required CheckboxSettings checkboxSettings,
    required VoidCallback voidCallback,
  }) =>
      ListTile(
        onTap: voidCallback,
        leading: Checkbox(
          value: checkboxSettings.value,
          onChanged: (value) => voidCallback(),
        ),
        title: Text(
          checkboxSettings.title,
          style: TextStyle(fontSize: 20),
        ),
      );
}
