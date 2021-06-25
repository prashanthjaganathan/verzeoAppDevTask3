import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/user.dart';
import './home.dart';

class Register extends StatefulWidget {
  //const Register({ Key? key }) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void save() async {
    //await Register.init();
    //print('In save');
    localStorage?.setString('name', name);
    localStorage?.setString('email', email);
    localStorage?.setString('password', password);

    //print('Data saved.');
    //print(localStorage?.get('name[$n]'));

    // print(localStorage?.get('email'));
    // print(localStorage?.get('password'));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
                padding: const EdgeInsets.only(left: 130, top: 50),
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
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
                          onSubmitted: (val) {
                            name = val;
                          },
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Theme.of(context).accentColor,
                            ),
                            hintText: 'DISPLAY NAME',
                            hintStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
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
                          onSubmitted: (val) {
                            email = val;
                          },
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.mail,
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
                          onSubmitted: (val) {
                            password = val;
                          },
                          cursorColor: Theme.of(context).accentColor,
                          obscureText: true,
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
                          if (password == null &&
                              email == null &&
                              name == null) {
                            print('in if');
                            Fluttertoast.showToast(
                                msg: 'Please fill in all the details.');
                          } else {
                            save();
                            print('in else');
                            Fluttertoast.showToast(msg: 'Account Created!!');

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          }
                        },
                        child: Container(
                            height: 45,
                            width: 365,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: Text(
                              'CREATE ACCOUNT ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            )))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      // body: Column(
      //   children: [
      //     TextField(
      //       decoration: InputDecoration(
      //         icon: Icon(Icons.person_off_outlined),
      //         labelText: 'DISPLAY NAME',
      //       ),
      //     ),
      //     TextField(
      //       decoration: InputDecoration(
      //         icon: Icon(Icons.mail),
      //         labelText: 'EMAIL',
      //       ),
      //     ),
      //     TextField(
      //       decoration: InputDecoration(
      //         icon: Icon(Icons.lock),
      //         labelText: 'PASSWORD',
      //       ),
      //     ),
      //     TextButton(onPressed: () {}, child: Text('Register')),
      //   ],
      // ),
    );
  }
}
