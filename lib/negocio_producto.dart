import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketplace/buscar.dart';
import 'package:marketplace/buscar_por_tipo.dart';
import 'package:marketplace/clientes.dart';
import 'package:marketplace/filtrarProductos.dart';
import 'package:marketplace/filtroActividad.dart';
import 'package:marketplace/filtroProducto.dart';
import 'package:marketplace/negocios.dart';
import 'package:marketplace/registroClientes.dart';



class FiltroNegocioP extends StatelessWidget {
  const FiltroNegocioP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
          backgroundColor: Colors.brown.shade200,
          appBar: AppBar(
            backgroundColor: Colors.brown.shade900,
            title: const Text("Listado de Productos"),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              //padding: EdgeInsets.all(20),
                children: [

                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      //color: Color.fromARGB(40, 200, 0, 0)
                        gradient: LinearGradient(colors: [Colors.brown, Colors.black38], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                    ),
                    accountName: const Text("Usuario"),
                    accountEmail: const Text("usuario@gmail.com"),
                    currentAccountPicture:Image.asset("img/market.png"),
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
                    selected: true,
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
                    title: const Text("Filtrar Productos"),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.business_center_outlined),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FiltroPorProductos()),
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
                  ListTile(
                    title: const Text("validar "),
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.add_shopping_cart),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FiltroNegocioP()),
                      );
                    },
                  ),

                ]
            ),
          ),
          body: (
              negocio_producto()
          )
      ),
    );
  }
}

class negocio_producto extends StatefulWidget{

  const negocio_producto({Key? key}) : super(key: key);

  @override
  _FiltoNegocioProductoState createState() => _FiltoNegocioProductoState();

}

class _FiltoNegocioProductoState extends State<negocio_producto>{
  TextEditingController buscar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Negocio"),
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Digite el nombre del negocio"
                    ),
                  ),
                ),
                Expanded(
                    child: BuscarNegocio(textdato:buscar.text,)
                )
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}

class BuscarNegocio extends StatelessWidget {
  final String textdato;
  const BuscarNegocio({Key? key,required this.textdato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consultar = FirebaseFirestore.instance.collection("productos").where("negocio",isEqualTo: textdato).snapshots();
    return Column(
      children: [
        Expanded(
            child:Container(
              padding: EdgeInsets.all(10),
              color: Colors.greenAccent ,
              child: StreamBuilder<QuerySnapshot>(
                stream: consultar,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return Center( child: CircularProgressIndicator(),);
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document)
                  {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ListTile(
                            title: Text(data['nombre']),
                          ),
                        )
                      ]
                    );
                  }
                  ).toList(),
                  );
                },
              ),
            )
        )
      ],
    );
  }
}

