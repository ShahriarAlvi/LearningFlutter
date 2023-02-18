import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('ID Card'),
        centerTitle: true,
        backgroundColor: Colors.amber[300],
      ),
      body:
      Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              //alignment: Alignment.centerLeft,
                child: Image.asset('assets/1672921962063.jpg', )),
          ),

          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 0),
              //color: Colors.blue,
              alignment: Alignment.centerLeft,
              child: Text('Name',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 17,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
              //color: Colors.cyan,
              alignment: Alignment.centerLeft,
              child: Text('Sherlock Holmes',
              style: TextStyle(
              color: Colors.amber,
                fontSize: 30,
              ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 6),
                //color: Colors.green,
                alignment: Alignment.centerLeft,
                child: Text('Address',
                  style: TextStyle(
                    color: Colors.white,
                  ), )),
          ),

          Expanded(

            flex: 3,
            child: Container(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Text('221/B Baker Street',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 40,
                  ),)),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 250),
            child: Row(
              children: [
                Icon(Icons.mail,
                  color: Colors.white,),
                Text('sherlocked@gmail..com',
                    style: TextStyle(
                    color: Colors.white,
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
