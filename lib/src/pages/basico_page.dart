import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estilosTitulo    = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estilosSubTitulo = TextStyle(fontSize: 20.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image(
            image: NetworkImage('https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=1&w=500'),
            
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Nice Lake', style: estilosTitulo),
                      SizedBox(height: 7.0,),
                      Text('El lago mas lindo del...', style: estilosSubTitulo)
                    ],
                  ),
                ),

                Icon(Icons.star, color: Colors.red, size: 30.0),
                Text('41', style: TextStyle(fontSize: 20.0),)
              ],
            ),
          )
          
        ],
      ),
    );
  }
}