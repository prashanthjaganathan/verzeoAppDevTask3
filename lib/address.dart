import 'package:flutter/material.dart';
import 'package:testt/account.dart';
import 'package:testt/user.dart';

class AddAddress extends StatefulWidget {
  //const AddAddress({ Key? key }) : super(key: key);
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  late String _addName, _addHouse, _addLoc, _addCity, _addpin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Add Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (val) {
                  _addName = val;
                  //print('Name: $_addName');

                  //print(address[0]);
                  //print(address);
                },
                decoration: InputDecoration(
                  hintText: 'Full Name',
                ),
              ),
              TextField(
                onChanged: (val) {
                  _addHouse = val;
                  //print('House No: $_addHouse');
                  //print(address[1]);
                  //print(address);
                },
                decoration: InputDecoration(
                  labelText: 'House no / Building name',
                ),
              ),
              TextField(
                onChanged: (val) {
                  _addLoc = val;
                  //print('Locality: $_addLoc');
                  // print(address[2]);
                  //print(address);
                },
                decoration: InputDecoration(
                  labelText: 'Locality',
                ),
              ),
              TextField(
                onChanged: (val) {
                  _addCity = val;
                  // print('City: $_addCity');
                  //print(address[3]);
                  //print(address);
                },
                decoration: InputDecoration(
                  labelText: 'City',
                ),
              ),
              TextField(
                onChanged: (val) {
                  _addpin = val;
                  //print('PinCode: $_addpin');
                  //print(address[4]);
                  //print(address);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                ),
              ),
              SizedBox(
                height: 260,
              ),
              ElevatedButton(
                onPressed: () {
                  address.add(_addName);
                  address.add(_addHouse);
                  address.add(_addLoc);
                  address.add(_addCity);
                  address.add(_addpin);
                  //print('Im pushing now');
                  //print(address);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AccountDetails();
                  }));
                },
                child: SizedBox(
                    width: 400,
                    height: 30,
                    child: Center(
                        child: Text(
                      'Add Address',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
