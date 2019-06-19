import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _textoPricipal(),
                _botonesRedondeados()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _menuNavegacion()
    );
  }

  Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    final cajaRosa = Positioned(
      top: -70,
      left: -30,
      child: Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 142, 172, 1.0)
              ]
            ),
            borderRadius: BorderRadius.circular(80.0)
          ),
        ),
      ),
    );
    
    

    return Stack(
      children: <Widget>[
        gradiente,
        cajaRosa
      ],
    );
  }

  Widget _textoPricipal(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Gastos Mensules', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Este texto de relleno esta super bueno espero que les gusto', style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }

  Widget _menuNavegacion(){
    return BottomNavigationBar(
      fixedColor: Colors.pinkAccent,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment(-1.0, 4.8),
                
                colors: <Color>[
                  Color.fromRGBO(236, 98, 188, 1.0),
                  Colors.blue
                ],
                tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: Icon(Icons.camera),
          ),
          icon: Icon(Icons.camera),
          title: Container()
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outlined),
          title: Container()
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          title: Container()
        )
      ],
    );
  }

  Widget _botonesRedondeados(){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Table(
        children: <TableRow>[
          TableRow(
            children: [
              _crearBotones(Color.fromRGBO(151, 205, 252, 1.0), Color.fromRGBO(75, 128, 202, 1.0), Icons.apps, 'General'),
              _crearBotones(Color.fromRGBO(180, 147, 251, 1.0), Color.fromRGBO(117, 83, 243, 1.0), Icons.directions_bus, 'Trasport'),
            ] 
          ),
          TableRow(
            children: [
              _crearBotones(Color.fromRGBO(241, 167, 244, 1.0), Color.fromRGBO(244, 77, 219, 1.0), Icons.shopping_cart, 'Shopping'),
              _crearBotones(Color.fromRGBO(253, 198, 149, 1.0), Color.fromRGBO(213, 139, 114, 1.0), Icons.attach_money, 'Bills'),
            ] 
          ),
          TableRow(
            children: [
              _crearBotones(Color.fromRGBO(124, 156, 222, 1.0), Color.fromRGBO(73, 93, 191, 1.0), Icons.movie_filter, 'Entertainment'),
              _crearBotones(Color.fromRGBO(153, 239, 166, 1.0), Color.fromRGBO(60, 173, 111, 1.0), Icons.restaurant, 'Grocery'),
            ] 
          ),
        ],
      ),
    );
  }

  Widget _crearBotones(Color colorStart, Color colorEnd,IconData icono, String text){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0
          ),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 5.0),
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      begin: FractionalOffset(0.9, 0.5),
                      end: FractionalOffset(0.0, 0.0),
                      colors: [
                        colorStart,
                        colorEnd
                      ]
                    ),
                  ),   
                  child: Icon(icono, color: Colors.white, size: 35.0,),
                ),
                Text(text, style: TextStyle(color: Colors.white)),
                SizedBox(height: 5.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}