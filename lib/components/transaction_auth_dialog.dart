import 'package:flutter/material.dart';

class TransactionAuthDiolog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDiolog({
    @required this.onConfirm,
  });

  @override
  _TransactionAuthDiologState createState() => _TransactionAuthDiologState();
}

class _TransactionAuthDiologState extends State<TransactionAuthDiolog> {

  // Já que criamos um controlador, então ele passou de StatelessWidget para StatefulWidget
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 64, letterSpacing: 24),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text('Confirm'),
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
