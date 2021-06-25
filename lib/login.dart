import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/user.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  //const LoginPage({ Key? key }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    setPreference().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> setPreference() async {
    localStorage = await SharedPreferences.getInstance();
  }

  var cemail, cpass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).accentColor,
        ),
        Container(
          margin: EdgeInsets.only(top: 90),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).accentColor,
                ),
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130, top: 100),
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: 365,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                              color: Theme.of(context).accentColor,
                              width: 1.3,
                            )),
                        child: TextField(
                          onChanged: (val) {
                            cemail = val;
                          },
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Theme.of(context).accentColor,
                            ),
                            hintText: 'EMAIL',
                            hintStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 45,
                        width: 365,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                              color: Theme.of(context).accentColor,
                              width: 1.3,
                            )),
                        child: TextField(
                          onChanged: (val) {
                            cpass = val;
                          },
                          obscureText: true,
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).accentColor,
                              ),
                              hintText: 'PASSWORD',
                              hintStyle: TextStyle(
                                color: Theme.of(context).accentColor,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextButton(
                        onPressed: () {
                          ((cemail == localStorage?.get('email')) &&
                                  (cpass == localStorage?.get('password')))
                              ? Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }))
                              : Fluttertoast.showToast(
                                  msg: 'Invalid login details!! Try again');
                        },
                        child: Container(
                            height: 45,
                            width: 365,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            )))),
                    // Text('${localStorage?.get('email')}'),
                    // Text('${localStorage?.get('password')}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
