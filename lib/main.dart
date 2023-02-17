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
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('hi '),
            Text('hellow'),]
          ),

          Container(
            padding: EdgeInsets.all(20),
            color: Colors.limeAccent,
            child: Text('One',
            style: TextStyle(
              color: Colors.red,
            ),)
          ),

          Container(
              padding: EdgeInsets.all(40),
              color: Colors.red,
              child: Text('Two',
                style: TextStyle(
                  color: Colors.cyan,
                ),)
          ),

          Container(
              padding: EdgeInsets.all(60),
              color: Colors.green,
              child: Text('Three',
                style: TextStyle(
                  color: Colors.black,
                ),)
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
