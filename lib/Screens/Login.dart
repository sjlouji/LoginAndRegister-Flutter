import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loginandregister_flutter/Screens/Home.dart';
import 'package:loginandregister_flutter/Screens/Register.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginPageScreen();
  }
}

class LoginPageScreen extends StatefulWidget {
  LoginPageScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blueAccent, //change your color here
        ),
        leading: Icon(Icons.keyboard_arrow_left),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                width: 50,
                padding: EdgeInsets.only(bottom: 30),
                child: Image.asset('Assets/youtube.png'),
              ),
              Center(
                  child: Text('Login In Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
              ),
               Center(
                 child: Text('Kindly Login to continue using our app', style: TextStyle(fontSize: 13, color: Colors.grey[600]),),
               ),
              Container(
                padding: EdgeInsets.only(top: 80, left: 40, right: 40 ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email Field must not be empty';
                          }
                          return null;
                        },
                        decoration: new InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                        obscureText: !_showPassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password Field must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(),
                          contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),

                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglevisibility();
                            },
                            child: Container(
                              height: 50,
                              width: 70,
                              padding: EdgeInsets.symmetric(vertical: 13),
                              child: Center(
                                child: Text(
                                  _showPassword ? "Hide" : "Show",
                                  style: TextStyle(color: Colors.blueAccent, fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: FlatButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 70,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                                "Forgot Password?",
                                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
                                textAlign: TextAlign.right,
                            ),
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            print("Forgot Passworda Clicked",);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: FlatButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 70,
                          child: Text('Login'),
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            print('Logged In');
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Text('Do not have an Account? SignUp'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: Text('or connect with'),
                    ),
                    Container(
                      padding: EdgeInsets.only( left: 30, right: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('Assets/facebook.png'),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('Assets/google.png'),
                              ),
                            ),
                            Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('Assets/twitter.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
