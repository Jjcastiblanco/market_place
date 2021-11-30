import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:marketplace/detalle_neg.dart';
import 'package:marketplace/registroClientes.dart';

import 'buscar.dart';
import 'buscar_por_tipo.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';

class negocios extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text("Listado de negocios"),
          ),
          drawer: Drawer(
            child: ListView(
              //padding: EdgeInsets.all(20),
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      //color: Color.fromARGB(40, 200, 0, 0)
                        gradient: LinearGradient(colors: [Colors.blueAccent, Colors.black38], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                    ),
                    accountName: const Text("Anonimo"),
                    accountEmail: const Text("Anonimo"),
                    currentAccountPicture:Image.asset("img/shop.png"),
                  ),
                  ListTile(
                    title: const Text("Gestion Clientes"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.supervised_user_circle),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GestionClientes()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Lista Negocios"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.assignment_outlined),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => negocios()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Listado Productos"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.assignment_outlined),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FiltroProducto()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Buscar Negocios"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.business_center_outlined),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Buscar()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Buscar Tipo Negocios"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.business_center_outlined),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FiltroCategoria()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Buscar Negocios Actividad"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.business_center_outlined),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Buscar_por_tipo()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Comprar"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.add_shopping_cart),
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Buscar_por_tipo()),
                      // );
                    },
                  ),
                ]
            ),
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