import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Home()
));

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
      body: Container(
        padding: EdgeInsets.fromLTRB(1, 10, 20, 30),
        margin: EdgeInsets.all(30),
        color: Colors.grey[300],
        child: Text('hi',
        style: TextStyle(
          color: Colors.red,
        ))
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('click'),
        backgroundColor: Colors.amber[300],
      ),
    );
  }
}



