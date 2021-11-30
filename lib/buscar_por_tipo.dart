
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/main.dart';
import 'package:marketplace/registroClientes.dart';

import 'buscar.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';
import 'negocios.dart';

class Buscar_por_tipo  extends StatefulWidget {
  const Buscar_por_tipo({Key? key}) : super(key: key);

  @override
  BuscarPorTipoState createState() => BuscarPorTipoState();
}

class BuscarPorTipoState extends State<Buscar_por_tipo> {
  TextEditingController buscar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Filtrar por datos"),
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
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Digite el dato a buscar"
                    ),
                  ),
                ),
                Expanded(
                  child:BuscarServicios(
                  text: buscar.text,
                 ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuscarServicios extends StatelessWidget {
  final String text;
  const BuscarServicios({Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consultar= FirebaseFirestore.instance.collection('negocios').where('actividad',isEqualTo:text).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream:consultar,
      builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Tiene errores");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Cargando....");
        }
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data=document.data()! as Map<String,dynamic>;
              return Container(
                color: Colors.indigo,
                margin: EdgeInsets.only(top:5),
                child: ListTile(
                  //title: Text(data['actividad']),
                  subtitle: Text(data['nombre']),
                ),
              );
            }
            ).toList()
        );
      },
    );
  }
}

