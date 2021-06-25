import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testt/user.dart';
import './account.dart';
import './main.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Razorpay _razorpay;
  var donateName;
  var donateEmail;
  late int donateAmount;
  var donatePhone;
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    //print(response);
    Fluttertoast.showToast(
      msg: 'Payment Successful!! Thank you for your support',
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    //print(response);
    Fluttertoast.showToast(
      msg:
          'Encountered an error while processing the payment. Please do try again',
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    // print(response);
    Fluttertoast.showToast(
      msg: 'You will be redirected to the wallet gateway.',
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Padding(
            padding: EdgeInsets.only(left: 50), child: Text('The GO App')),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.lightGreen,
                        //Colors.black,
                        Colors.green.shade600,
                      ],
                    )),
                //color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.person_pin,
                      color: Colors.white,
                    ),
                    title: Text(
                      '${localStorage?.get('name')}',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AccountDetails();
                      }));
                    },
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Order History'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Help & Support'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.replay_outlined),
              title: Text('Updates'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Log out'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('No')),
                          TextButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg: 'You\'ve logged out successfully.',
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white);
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return StartPage();
                                }), (route) => false);
                              },
                              child: Text('Yes, Logout'))
                        ],
                        content: Text('Are you sure you want to logout?'),
                      );
                    });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text('${localStorage?.get('name')}'),
            // Text('${localStorage?.get('email')}'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Image.network(
                'https://images.pngnice.com/download/2007/Go-PNG-Free-Download.png',
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Would you like to donate for the further development of the app?',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      TextField(
                        onChanged: (val) {
                          donateName = val;
                        },
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        onChanged: (val) {
                          donateEmail = val;
                        },
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      TextField(
                        onChanged: (val) {
                          donateAmount = int.parse(val);
                          donateAmount = donateAmount * 100;
                        },
                        decoration: InputDecoration(labelText: 'Amount (INR)'),
                      ),
                      TextField(
                        onChanged: (val) {
                          donatePhone = val;
                        },
                        decoration: InputDecoration(labelText: 'Phone Number'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var options = {
                            'key': 'rzp_test_VYH7NQco37FvTb',
                            'amount':
                                donateAmount, //in the smallest currency sub-unit.
                            'name': '${donateName.toString()}',
                            // Generate order_id using Orders API
                            'description': 'Sample Donation',
                            'prefill': {
                              'contact': '$donatePhone',
                              'email': '${donateEmail.toString()}'
                            }
                          };

                          try {
                            _razorpay.open(options);
                          } catch (msg) {
                            print(msg);
                          }
                        },
                        child: Text('Proceed To Pay'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
