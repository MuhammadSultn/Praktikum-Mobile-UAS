import 'package:flutter/material.dart';


class Kategori extends StatefulWidget {
  @override
  _kategoriState createState() => _kategoriState();
}

class _kategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category App'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          IconButton(
            icon: Icon(Icons.gamepad),
            iconSize: 100,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.sports_esports),
            iconSize: 100,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.gamepad),
            iconSize: 100,
            onPressed: () {},
          ),

        ],
      ),
    );
  }
}