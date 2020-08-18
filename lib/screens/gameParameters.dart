import 'package:flutter/material.dart';
import 'package:undercover/utils/strings.dart';

class GameParameters {
  final TextEditingController _editingController = TextEditingController();

  createParametersAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(Strings.gameParam),
            content: Row(
              children: <Widget>[
                Text('Nombre de joueurs : '),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(controller: _editingController)),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Valider'),
                onPressed: () {},
              )
            ],
          );
        });
  }
}
