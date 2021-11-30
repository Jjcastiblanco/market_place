
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/clientes.dart';

class GestionClientes extends StatelessWidget {
  const GestionClientes({Key? key}) : super(key: key);

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
        shadowColor: Colors.teal,

        backgroundColor: Colors.blue.shade900,
        toolbarHeight: 60,
        title: Text('Market Place Gestion Clientes'),


      ),
      body: ListView(
        children: [

          Container(
            height: 150,
            padding: EdgeInsets.only(top: 40,bottom: 0),
            alignment: Alignment.topCenter,
            child: Image.asset('img/shop.png'),

          ),

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
                backgroundColor: Colors.blue.shade900,
                padding: EdgeInsets.all(10),

              ),


              onPressed: () {  },


              child: Text('Crear Cliente',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),


          Container(
            alignment: Alignment.center,

            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                padding: EdgeInsets.all(10),
              ),


              onPressed: () {  },


              child: Text('Consultar Cliente',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),



          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade900,

                padding: EdgeInsets.all(10),
              ),


              onPressed: () {  },


              child: Text('Actualizar Datos',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade900,

                padding: EdgeInsets.all(10),
              ),


              onPressed: () {  },


              child: Text('Eliminar Datos',
                style: TextStyle(
                  fontSize: 20,
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

class Cliente{
  String nombre="";
  String celular="";
  String telefono="";
  String direccion="";

  Cliente(this.nombre, this.celular, this.telefono, this.direccion);
}