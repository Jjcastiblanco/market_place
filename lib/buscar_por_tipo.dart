
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/registroClientes.dart';

import 'buscar.dart';
import 'detalle_neg.dart';
import 'filtrarProductos.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown.shade200,
        appBar: AppBar(
          backgroundColor: Colors.brown.shade900,
          title: Text("Market Place Filtrar por Actividad"),
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
                  selected: true,
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

              ]
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 380,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left:20, right: 20),
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50) ,
                    color: Colors.brown.shade100,
                    boxShadow: [BoxShadow (
                    color: Colors.black,
                      blurRadius: 10,
                    ),
                      ]

                  ),

                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Ingrese el dato a buscar"

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
        return GridView.count(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),

        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data=document.data()! as Map<String,dynamic>;
              return Container(
                color: Colors.brown.shade100,
                child: ListTile(
                  contentPadding: EdgeInsets.all(22),
                  title: Image.network(data['imagen'],width: 100,height: 50),
                  subtitle:Text('\n'+data['nombre']+'\n'+data['direccion']+'\n'+data["telefono"],
                    style:  TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade900 ),),

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

