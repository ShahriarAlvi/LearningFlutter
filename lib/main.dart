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
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('hi folks'),
          TextButton(
              onPressed: () {
                print('hoise');
              },
              style : ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.limeAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            child: Text('click')),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(30.0),
            child: Text(
              'inside container',
              style: TextStyle(
                color: Colors.red[600],
              ),
            )
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
