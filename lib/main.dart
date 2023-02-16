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
      body: Center(
        child: IconButton(
          onPressed: () {
            print('hoise');
          },
          icon: Icon(Icons.alternate_email),
          color: Colors.green[200],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('click'),
        backgroundColor: Colors.amber[300],
      ),
    );
  }
}



