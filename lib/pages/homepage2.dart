import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.favorite),
            title: Image.asset("images/frensh toast 2 copy.png"),
            subtitle: Text('Freench Toast with Berries'),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    Icon(Icons.star, color: Colors.orange),
                    Icon(Icons.star, color: Colors.orange),
                    Icon(Icons.star_half, color: Colors.orange),
                    Icon(Icons.star_border, color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.thumb_up),
                    Text('123'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.thumb_down),
                    Text('45'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


