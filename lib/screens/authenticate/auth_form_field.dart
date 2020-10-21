import 'package:Kchat/Services/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthTextField extends StatelessWidget {
  final void Function(String) onChanged;
  final void Function(String) validator;
  final Key key;

  AuthTextField(
      {this.hintText, @required this.onChanged, this.key, this.validator});

  String hintText = '';

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    return Form(
      child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          style: TextStyle(
              color: Colors.white, fontSize: screenSize.unikueWidth(0.027)),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Theme.of(context).primaryColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: screenSize.unikueWidth(0.006),
                      color: Theme.of(context).primaryColorLight)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: screenSize.unikueWidth(0.004),
                      color: Theme.of(context).primaryColorLight)))),
    );
  }
}
