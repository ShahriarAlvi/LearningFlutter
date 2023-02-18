import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.amber[300],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 10,
              child: Image.asset('assets/1672921962063.jpg')),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('one'),
            ),
          ),

          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pink,
              child: Text('Two'),),
          ),

          Expanded(
            flex: 1,
            child: Container(

              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child: Text('three'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.amber[300],
      ),
    );
  }
}
