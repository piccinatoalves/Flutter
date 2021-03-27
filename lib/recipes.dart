  import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const IconData star = IconData(0xea22, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receita do Gato',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Receita do Gato'),
        ),
        // Change to buildColumn() for the other column example
        body: Container(
          margin: EdgeInsets.all(30),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/gato.png',
              height: 100,
              width: 100,
            ),
            Text("Lorem Ipsum Dolor",
                  style: 
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                  ),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star),
              Icon(Icons.star),
            ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children:[
                     SizedBox(height: 10),
                     Icon(Icons.timer, color: Colors.green[500]),
                    Text('Prep:'),
                    Text('23 min')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.timer, color: Colors.green[500]),
                    Text('COOK:'),
                    Text('1H')

                ],),
                Column(
                  children: [
                     Icon(Icons.timer, color: Colors.green[500]),
                    Text('Prep:'),
                    Text('1H')
                  ],
                ),
              ],
            )
          ],
          
          
        )
        ),
      ),
    );
  }
}
