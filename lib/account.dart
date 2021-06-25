import 'package:flutter/material.dart';
import 'package:testt/user.dart';
import './address.dart';

class AccountDetails extends StatefulWidget {
  // const AccountDetails({ Key? key }) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  void initState() {
    super.initState();
    setState(() {
      //print('$address');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Account'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '${localStorage?.get('name')}',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            onSubmitted: (val) {
              setState(() {
                localStorage?.setString('name', val);
              });
            },
            decoration: InputDecoration(
              hintText: '${localStorage?.get('name')}',
              prefixIcon: Icon(
                Icons.person,
              ),
              suffixIcon: Icon(Icons.edit),
              border: InputBorder.none,
            ),
          ),
          TextField(
            onSubmitted: (val) {
              setState(() {
                //email = val;
                localStorage?.setString('email', val);
              });
            },
            decoration: InputDecoration(
              hintText: '${localStorage?.get('email')}',
              prefixIcon: Icon(
                Icons.mail,
              ),
              suffixIcon: Icon(Icons.edit),
              border: InputBorder.none,
            ),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          address.isEmpty
              ? TextButton(
                  onPressed: () {
                    print(address);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddAddress();
                    }));
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1.2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'ADD ADDRESS',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                )
              : ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Address'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: address.map((e) {
                      return Text(
                        '$e,',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
