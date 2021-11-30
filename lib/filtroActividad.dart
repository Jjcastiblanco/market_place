import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/registroClientes.dart';

import 'buscar.dart';
import 'buscar_por_tipo.dart';
import 'filtroProducto.dart';
import 'negocios.dart';


class FiltroCategoria extends StatefulWidget {
  const FiltroCategoria({Key? key}) : super(key: key);

  @override
  _FiltroCategoriaState createState() => _FiltroCategoriaState();
}

class _FiltroCategoriaState extends State<FiltroCategoria> {
  TextEditingController filtrar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Filtro por Categoria"),
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
        body: Center(
          child: SizedBox(width: 250,child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller:filtrar,
                  onChanged: (value){
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      hintText: "Ingrese dato a buscar"
                  ),
                ),
              ),
              Expanded(
                child: DatoFiltro(
                  text: filtrar.text,
                ),
              ),
            ],
          ),),
        ),
      ),
    );
  }
}

class DatoFiltro extends StatelessWidget{
  final String text;

  const DatoFiltro({Key? key, required this.text}):super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(text);
    final Stream<QuerySnapshot>filtroConsulta = FirebaseFirestore.instance.collection('negocios').where('categoria',isEqualTo:text).snapshots();
    //final Stream<QuerySnapshot>filtroConsulta = FirebaseFirestore.instance.collection('clientes').where('idioma',arrayContainsAny:[text.toLowerCase()]).snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream:filtroConsulta,
        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error al filtrar los negocios");
          }
          if (snapshot.data!.size<=0) {
            return Text("No se encuentran coincidencias");
          }
          if(!snapshot.hasData){
            return Center(child:CircularProgressIndicator());
          }
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document){
                Map<String,dynamic> data=document.data()! as Map<String,dynamic>;
                return Container(
                  color: Colors.indigo,
                  margin: EdgeInsets.only(top:6),
                  child: ListTile(
                    title: Text(data['nombre']),
                    subtitle: Text(data['direccion']),
                    leading: Image.network(data['imagen'],width: 100,height: 100),
                  ),
                );
              }
              ).toList()
          );
        }
    );
  }
}