import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:undercover/screens/gameScreen.dart';
import 'package:undercover/utils/strings.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _editingController = TextEditingController();
  final TextEditingController _editingControllerCivil = TextEditingController();
  final TextEditingController _editingControllerUndercover =
      TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    _editingControllerUndercover.dispose();
    _editingControllerCivil.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            Strings.applicationName,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 30.0,
                        width: 250.0,
                        child: MaterialButton(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Nouvelle partie',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          elevation: 5,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            createParametersAlertDialog(
                                context,
                                _editingController,
                                _editingControllerUndercover,
                                _editingControllerCivil);
                          },
                        ),
                      )),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 60.0,
                          width: 250.0,
                          child: MaterialButton(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Tutoriel',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              elevation: 5,
                              color: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              onPressed: () {}
//                        createParametersAlertDialog(context),
                              ),
                        )),
                  )),
              Expanded(
                flex: 5,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "à propos",
                          style: TextStyle(color: Colors.white),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  createParametersAlertDialog(
      BuildContext context,
      TextEditingController editingController,
      TextEditingController editingControllerUndercover,
      TextEditingController editingControllerCivil) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(Strings.gameParam),
            content: SizedBox(
              width: 100.0,
              child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(flex: 3, child: Text('Nombre de joueurs : ')),
                      Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextField(
                              maxLength: 1,
                              controller: _editingController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(flex: 3, child: Text('Nombre d\'Undercover : ')),
                      Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextField(
                              maxLength: 1,
                              controller: _editingControllerUndercover,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false, signed: false),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(flex: 3, child: Text('Nombre de civil : ')),
                      Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextField(
                              maxLength: 1,
                              controller: _editingControllerCivil,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false, signed: false),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Valider'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GameScreen(
                          int.parse(editingController.text),
                          int.parse(editingControllerUndercover.text),
                          int.parse(editingControllerCivil.text))));
                },
              )
            ],
          );
        });
  }
}
