import 'package:flutter/material.dart';
import 'package:loginandregister_flutter/Screens/Login.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 700,
                child: Image.asset('Assets/Main.jpg'),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('Welcome', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  Text('Create an account and access the dashboard page', style: TextStyle(color: Colors.grey[600]),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30)
                    ),
                    child: FlatButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Text('Getting Started'),
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Text("Already have an account ? Log In")
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
