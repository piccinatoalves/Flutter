  import 'package:flutter/material.dart';

void main() {
  runApp(FriendsApp());
}

class FriendsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus amigos',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Olá Amigos'),
          ),
          body: Center(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ola flutter coluna",
                  style: 
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                  ),
                ],
              ),
            ),
          )),
    );
  }
}