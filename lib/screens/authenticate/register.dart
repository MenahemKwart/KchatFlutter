import 'package:Kchat/Services/auth_service.dart';
import 'package:Kchat/Services/screen_size.dart';
import 'package:Kchat/models/user_models.dart';
import 'package:Kchat/screens/authenticate/auth_form_field.dart';
import 'package:Kchat/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _chek = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);
    DataUserModel userModel = DataUserModel();
    String errorMassage = '';

    void printErrorOnTheScreen(String massage) {
      setState(() {
        errorMassage = '$massage';
        print('$massage');
      });
    }
    String textFormsValidator(String val) {
      if (val.isEmpty) {
        return 'error!!!!';
      } else {
        return null;
      }
    }

    return Scaffold(
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(screenSize.wSize[1]),
            child: Container(
              padding: EdgeInsets.all(screenSize.unikueWidth(0.02)),
              color: Theme.of(context).primaryColorDark,
              width: screenSize.wSize[9],
              height: screenSize.hSize[8],
              child: Form(
                key: _chek,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Register!',
                        style: TextStyle(
                            fontSize: screenSize.wSize[1],
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    TextFormField(
                        validator: (val) {
                            if (val.isEmpty) {
                              return 'You must to write an email!';
                            } else {
                              return null;
                            }
                          },
                        
                        //onChanged: (val) {},
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.unikueWidth(0.027)),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            hintText: 'hintText',
                            hintStyle: TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Theme.of(context).primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: screenSize.unikueWidth(0.006),
                                    color:
                                        Theme.of(context).primaryColorLight)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: screenSize.unikueWidth(0.004),
                                    color:
                                        Theme.of(context).primaryColorLight)))),
                    /*Spacer(
                  flex: 4,
                ),
                AuthTextField(
                  validator: textFormsValidator,
                  hintText: 'E-mail',
                  onChanged: (val) {
                    userModel.email = val;
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                AuthTextField(
                  validator: textFormsValidator,
                  hintText: 'Password',
                  onChanged: (val) {
                    userModel.password = val;
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                AuthTextField(
                  validator: textFormsValidator,
                  hintText: 'Confirm Password',
                  onChanged: (val) {},
                ),
                Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: screenSize.wSize[4]),
                      child: AuthTextField(
                        validator: textFormsValidator,
                        hintText: 'First Name',
                        onChanged: (val) {},
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: screenSize.wSize[4]),
                      child: AuthTextField(
                        validator: textFormsValidator,
                        hintText: 'Last Name',
                        onChanged: (val) {},
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 3,
                ),*/
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(screenSize.unikueWidth(0.01)),
                      child: RaisedButton(
                        padding: EdgeInsets.all(screenSize.unikueWidth(0.015)),
                        child: Text('Register!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.unikueWidth(0.027))),
                        color: Theme.of(context).accentColor,
                        onPressed: () async {
                          print("email: ${userModel.email}");
                          print("password: ${userModel.password}");
                          if (userModel.emailAndPasswordExist()) {
                            MyUser user = await AuthService()
                                .registerWithEmailAndPassword(
                                    email: userModel.email,
                                    password: userModel.password);
                            if (user == null) {
                              printErrorOnTheScreen(
                                  'Please chek if all the fields are full and correct');
                            }
                          } else {
                            printErrorOnTheScreen(
                                'Please chek if all the fields are full and correct');
                          }
                        },
                      ),
                    ),
                  /*Spacer(flex: 2),
                    Text(errorMassage, style: TextStyle(color: Colors.red)),
                    Spacer(flex: 2),*/
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(screenSize.unikueWidth(0.013)),
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text('Have an accuont? Sign In!'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInPage()));
                        },
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
