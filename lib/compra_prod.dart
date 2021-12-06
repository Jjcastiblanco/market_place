import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketplace/carrito_compras.dart';
import 'package:marketplace/filtrarProductos.dart';
import 'package:marketplace/registroClientes.dart';

import 'buscar.dart';
import 'buscar_por_tipo.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';
import 'negocios.dart';

class Compras extends StatefulWidget {
  const Compras({Key? key}) : super(key: key);

  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  TextEditingController prodBuscar= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.brown.shade200,
          appBar: AppBar(
            backgroundColor: Colors.brown.shade900,
            title: Text("A Comprar"),
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
                    currentAccountPicture: Image.asset("img/market.png"),
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
                        MaterialPageRoute(
                            builder: (context) => FiltroProducto()),
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
                            builder: (context) => FiltroCategoria()),
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
                    selected: true,
                    //leading: Image.asset("img/fondo.jpg"),
                    leading: const Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Compras()),
                      );
                    },
                  ),
                ]),
          ),
          body: Center(
            child: SizedBox(width: 250,child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller:prodBuscar,
                    onChanged: (value){
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: "Ingrese negocio a buscar"
                    ),
                  ),
                ),
                Expanded(
                  child: DatoFiltro(
                    text: prodBuscar.text,
                  ),
                ),
              ],
            ),),
          ),
        )
    );
  }
}

class DatoFiltro extends StatelessWidget{
  final String text;
  final List listAgreg=[];

  DatoFiltro({Key? key, required this.text}):super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(text);
    final Stream<QuerySnapshot>filtroConsulta = FirebaseFirestore.instance.collection('productos').where('negocio',isEqualTo:text).snapshots();

    return Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.white38,
                  child: StreamBuilder<QuerySnapshot>(
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
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.brown.shade100,
                                  //margin: EdgeInsets.only(top:6),
                                  child: ListTile(
                                    title:
                                    Image.network(data['imagen'], width: 200, height: 100),
                                    //leading: Text(data['nombre'] ),
                                    subtitle: Text(
                                        data['nombre'] + '\n\$  ' + data['precio'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 15)),
                                    onTap: (){
                                      listAgreg.add([data["nombre"],data["precio"]]);
                                      print(listAgreg);
                                      var prod_add = data["nombre"];
                                      Fluttertoast.showToast(msg: "El producto "+prod_add+". Se agrego a su lista de compras",
                                          fontSize: 20,
                                          backgroundColor: Colors.amberAccent,
                                          textColor: Colors.black,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER);
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) => _buildPopupDialog(context,prod_add),
                                      // );
                                    },
                                  ),
                                )
                              ],
                            );
                          }
                          ).toList()
                      );
                    },
                  )
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(bottom: 30),
                padding: EdgeInsets.all(15),
                height: 100,
                color: Colors.green,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.add_shopping_cart, size: 30,),
                    label: const Text("Ver Carrito",textAlign: TextAlign.center,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CarritoCompras(lista:listAgreg)));
                    }
                )
            ),

          )
        ]
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String text) {
  return AlertDialog(
    title: Text("El producto "+text+". Se agrego a su lista de compras"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const <Widget>[
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Volver'),
      ),
    ],
  );
}

