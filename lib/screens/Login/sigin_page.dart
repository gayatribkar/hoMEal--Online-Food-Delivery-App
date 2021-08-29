import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_data.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/SignIn';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;

  final inputtedUserName = TextEditingController();
  final inputtedPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataFinal>(context);
    final userData = userDataProvider.items;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          margin: EdgeInsets.only(left: 30, top: 50, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s sign you in.',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              Text(
                'Welcome back.',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
              Text(
                'You\'ve been missed!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.all(5),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: inputtedUserName,
                  decoration: InputDecoration(
                    hintText: 'EmailId / PhoneNumber',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.all(5),
                child: TextField(
                  obscureText: _obscureText,
                  style: TextStyle(color: Colors.black),
                  controller: inputtedPassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        semanticLabel:
                            _obscureText ? 'show password' : 'hide password',
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.lightBlueAccent[700],
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed('/RegisterPage');
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: () {
                    var flag = -1;
                    for (var i = 0; i < userData.length; i++) {
                      if ((inputtedUserName.text == userData[i].emailId ||
                          inputtedUserName.text ==
                              userData[i].phoneNo.toString())) {
                        if (inputtedPassword.text == userData[i].password) {
                          flag = i;
                          Navigator.of(context)
                              .popAndPushNamed('/MainWidget', arguments: {
                            'id': userData[i].id,
                            // 'phoneNo': userData[i].phoneNo,
                            // 'address': userData[i].address,
                            // 'emailId': userData[i].emailId,
                          });
                        }
                      }
                    }
                    if (flag == -1) {
                      showAlertDialog(context);
                    }
                    setState(() {
                      inputtedPassword.clear();
                      inputtedUserName.clear();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: ListTile(
        leading: Icon(
          Icons.info_outline_rounded,
          color: Colors.black,
          size: 50,
        ),
        title: Text(
          'Error!!',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      content: Text("Invalid UserName or Password."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
