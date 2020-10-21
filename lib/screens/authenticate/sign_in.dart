import 'package:Kchat/Services/screen_size.dart';
import 'package:Kchat/screens/authenticate/auth_form_field.dart';
import 'package:Kchat/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);
    String password;
    String email;

    return Scaffold(
      body: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(screenSize.wSize[1]),
        child: Container(
          padding: EdgeInsets.all(screenSize.unikueWidth(0.02)),
          color: Theme.of(context).primaryColorDark,
          width: screenSize.wSize[9],
          height: screenSize.hSize[6],
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Welcome!',
                    style: TextStyle(
                        fontSize: screenSize.wSize[1],
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                Spacer(
                  flex: 3,
                ),
                AuthTextField(
                  onChanged: (val) {
                    email = val;
                  },
                  hintText: 'E-mail',
                ),
                Spacer(
                  flex: 2,
                ),
                AuthTextField(
                  onChanged: (val) {
                    email = val;
                  },
                  hintText: 'Password',
                ),
                Spacer(
                  flex: 2,
                ),
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(screenSize.unikueWidth(0.01)),
                  child: RaisedButton(
                    padding: EdgeInsets.all(screenSize.unikueWidth(0.015)),
                    child: Text('Sign In!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.unikueWidth(0.027))),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      print(email);
                      print(password);
                    },
                  ),
                ),
                Spacer(flex: 4),
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(screenSize.unikueWidth(0.013)),
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('Dont have an accuont? Register!'),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
