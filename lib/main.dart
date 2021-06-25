import 'package:flutter/material.dart';
//import './home.dart';
import 'login.dart';
import './register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const StartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent,
      ),
      title: "Task 3",
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  // const StartPage({ Key? key }) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(300)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110, top: 50),
            child: Container(
              height: 135,
              width: 135,
              child: Center(
                child: Text('GO',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 76.8,
                        fontWeight: FontWeight.w900)),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 230, top: 160),
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 210, top: 240),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 380,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Container(
                        height: 40,
                        width: 340,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        )))),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  },
                  child: Container(
                      height: 40,
                      width: 340,
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
