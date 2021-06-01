import 'login.dart' as loginer;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final mailController = TextEditingController();
  final pwController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String token;

  @override
  void dispose() {
    pwController.dispose();
    mailController.dispose();
    super.dispose();
  }

  Future<void> _buildAlert(BuildContext context, Exception e) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: mailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Nom d\'utilisateur'),
                    validator: (mail) {
                      if (mail == null || mail.isEmpty) {
                        return ('Merci de saisir votre email');
                      } else if (!EmailValidator.validate(mail, true)) {
                        return ('Merci de saisir une adresse mail valide');
                      }
                      return (null);
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: pwController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Mot de passe'),
                    validator: (mail) {
                      if (mail == null || mail.isEmpty) {
                        return ('Merci de saisir votre mot de passe');
                      }
                      return (null);
                    },
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          loginer.ToLogin login = new loginer.ToLogin(
                              mailController.text, pwController.text);
                          try {
                            await login
                                .request()
                                .then((value) => token = value.token);
                            print(token);
                          } on Exception catch (e) {
                            _buildAlert(context, e);
                          }
                        }
                      },
                      child: Text('Valider')))
            ])));
  }
}
