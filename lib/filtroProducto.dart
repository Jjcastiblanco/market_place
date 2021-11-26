import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

class FiltroProducto extends StatelessWidget {
  const FiltroProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            title: const Text("Listado de Productos"),
          ),
          body: (
              FiltroP()
          )
      ),
    );
  }
}

class FiltroP extends StatefulWidget {
  const FiltroP({Key? key}) : super(key: key);

  @override
  _FiltroPState createState() => _FiltroPState();
}

class _FiltroPState extends State<FiltroP> {

  final Stream<QuerySnapshot> consultarProductos = FirebaseFirestore.instance.collection('productos').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:consultarProductos,
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Existe error al consultar el Producto");
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Text("Conectando...");
        }
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data=document.data()! as Map<String,dynamic>;
              return Container(
                color: Colors.indigo,
                margin: EdgeInsets.only(top:6),
                child: ListTile(
                  title: Text(data['nombre']),
                  subtitle: Text(data['precio']),
                ),
              );
            }
            ).toList()
        );
      },
    );
  }
}

