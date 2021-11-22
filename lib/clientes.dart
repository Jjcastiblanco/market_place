import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';


class clientes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text("Listado clientes"),
          ),
        body: (
            Consultas()
        )
      ),
    );
  }
}
class Consultas extends StatefulWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  _ConsultasState createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {

  final Stream<QuerySnapshot> consultarClientes = FirebaseFirestore.instance.collection('clientes').snapshots();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream:consultarClientes,
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Existe error al consultar clientes");
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
                subtitle: Text(data['celular']),
              ),
            );
          }
          ).toList()
        );
      },
    );
  }
}
