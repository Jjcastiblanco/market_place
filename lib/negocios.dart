import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:marketplace/detalle_neg.dart';

class negocios extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text("Listado de negocios"),
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

  final Stream<QuerySnapshot> consultarNegocios = FirebaseFirestore.instance.collection('negocios').snapshots();
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream:consultarNegocios,
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Existe error al consultar los negocios");
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Text("Conectando...");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document){
            Map<String,dynamic> data=document.data()! as Map<String,dynamic>;
            return Container(
              color: Colors.blue.shade300,
              margin: EdgeInsets.only(top:6),
              child: ListTile(
                title: Text(data['nombre']),
                subtitle: Text(data['direccion']),
                leading: Image.network(data['imagen'],width: 100,height: 100),
                onTap: (){
                  Negocios neg=Negocios(data["nombre"], data["celular"], data["direccion"], data["geolocalizacion"], data["imagen"], data["paginaWeb"], data["telefono"], data["categoria"], data["actividad"], data["codigo"]);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> detalleNegocios(negocio: neg))
                  );
                },
              ),
            );
          }
          ).toList()
        );
      },
    );
  }
}

class Negocios{
  String nombre="";
  String celular="";
  String direccion="";
  String geolocalizacion="";
  String imagen="";
  String paginaWeb="";
  String telefono="";
  String categoria="";
  String actividad="";
  String codigo="";

  Negocios(
      this.nombre,
      this.celular,
      this.direccion,
      this.geolocalizacion,
      this.imagen,
      this.paginaWeb,
      this.telefono,
      this.categoria,
      this.actividad,
      this.codigo);
}