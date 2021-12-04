import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:marketplace/registroClientes.dart';

import 'buscar.dart';
import 'buscar_por_tipo.dart';
import 'filtroProducto.dart';
import 'negocios.dart';

class FiltroPorProductos extends StatefulWidget {
  const FiltroPorProductos({Key? key}) : super(key: key);

  @override
  _FiltroPorProductosState createState() => _FiltroPorProductosState();
}

class _FiltroPorProductosState extends State<FiltroPorProductos> {
  TextEditingController filtrar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown.shade200,
        appBar: AppBar(
          backgroundColor: Colors.brown.shade900,
          title: Text(" Market Place Filtrar por Productos"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
              //padding: EdgeInsets.all(20),
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      //color: Color.fromARGB(40, 200, 0, 0)
                      gradient: LinearGradient(
                          colors: [Colors.brown, Colors.black38],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  accountName: const Text("Usuario"),
                  accountEmail: const Text("usuario@gmail.com"),
                  currentAccountPicture: Image.asset(
                    "img/market.png",
                    height: 10,
                  ),
                ),
                ListTile(
                  title: const Text("Gestion Clientes"),
                  //leading: Image.asset("img/fondo.jpg"),
                  leading: const Icon(Icons.supervised_user_circle),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GestionClientes()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Lista Negocios"),
                  //leading: Image.asset("img/fondo.jpg"),
                  leading: const Icon(Icons.assignment_outlined),
                  onTap: () {
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
                  onTap: () {
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
                  onTap: () {
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FiltroPorProductos()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Buscar Negocios Actividad"),
                  //leading: Image.asset("img/fondo.jpg"),
                  leading: const Icon(Icons.business_center_outlined),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Buscar_por_tipo()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Filtrar Productos"),
                  //leading: Image.asset("img/fondo.jpg"),
                  leading: const Icon(Icons.business_center_outlined),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FiltroPorProductos()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Comprar"),
                  //leading: Image.asset("img/fondo.jpg"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Buscar_por_tipo()),
                    // );
                  },
                ),
              ]),
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.brown.shade100,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: filtrar,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration:
                        InputDecoration(hintText: "Ingrese dato a buscar"),
                  ),
                ),
                Expanded(
                  child: DatoFiltro(
                    text: filtrar.text,
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

class DatoFiltro extends StatelessWidget {
  final String text;

  const DatoFiltro({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(text);
    final Stream<QuerySnapshot> filtroConsulta = FirebaseFirestore.instance
        .collection('productos')
        .where('nombre', isEqualTo: text)
        .snapshots();
    //final Stream<QuerySnapshot>filtroConsulta = FirebaseFirestore.instance.collection('clientes').where('idioma',arrayContainsAny:[text.toLowerCase()]).snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: filtroConsulta,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error al filtrar los negocios");
          }
          if (snapshot.data!.size <= 0) {
            return Text("No se encuentran coincidencias");
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.brown.shade100,
                  child: ListTile(
                    title:
                        Image.network(data['imagen'], width: 200, height: 100),
                    //leading: Text(data['nombre'] ),
                    subtitle: new Text(
                        data['nombre'] + '\n\$  ' + data['precio'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                );
              }).toList());
        });
  }
}
