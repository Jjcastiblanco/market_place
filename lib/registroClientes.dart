
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistroClientes extends StatelessWidget {
  const RegistroClientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: ReCliente(),

    );
  }
}
class ReCliente extends StatefulWidget {
  const ReCliente({Key? key}) : super(key: key);

  @override
  _ReClienteState createState() => _ReClienteState();
}

class _ReClienteState extends State<ReCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.cyanAccent,
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        title: Text('Market Place'),

      ),
      body: ListView(
        children: [

          Container(
            height: 150,
            padding: EdgeInsets.only(top: 40,bottom: 0),
            alignment: Alignment.topCenter,
            child: Image.asset('img/shop.png'),

          ),
          Container(),
          Container(
            padding: EdgeInsets.only(right: 30,left: 30, top: 40),
            alignment: Alignment.center,
            child: TextField(

              decoration: InputDecoration(
                hintText: 'Nombre',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 30,left: 30, top: 40),
            alignment: Alignment.center,
            child: TextField(

              decoration: InputDecoration(
                hintText: 'Celular',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 30,left: 30, top: 40),
            alignment: Alignment.center,
            child: TextField(

              decoration: InputDecoration(
                hintText: 'Telefono',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 30,left: 30, top: 40,bottom: 30),
            alignment: Alignment.center,
            child: TextField(

              decoration: InputDecoration(
                hintText: 'Direccion',
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,

            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black54,
                padding: EdgeInsets.all(10),

              ),


              onPressed: () {  },


              child: Text('Ingresar',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black54,

                padding: EdgeInsets.all(10),
              ),


              onPressed: () {  },


              child: Text('Actualizar',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

