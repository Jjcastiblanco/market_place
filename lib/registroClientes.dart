
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'buscar.dart';
import 'buscar_por_tipo.dart';
import 'filtrarProductos.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';
import 'negocios.dart';

class GestionClientes extends StatelessWidget {
  const GestionClientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: ReCliente(),

    );
  }
}
class ReCliente extends StatefulWidget {
  const ReCliente({Key? key}) : super(key: key);

  @override
  _ReClienteState createState() => _ReClienteState();
}

class _ReClienteState extends State<ReCliente> {

  final direccion = TextEditingController();
  final nombre = TextEditingController();
  final celular = TextEditingController();
  final telefono = TextEditingController();
  final codigo = TextEditingController();

  CollectionReference datoscliente = FirebaseFirestore.instance.collection("clientes");


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade900,
        shadowColor: Colors.brown.shade900,
        elevation: 200,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('Market Place Gestion Clientes'),

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


      body: ListView(

        children: [

          // 1 container solo la imagen
          Container(
            height: 200,
            padding: const EdgeInsets.only(top: 40,bottom: 0),
            alignment: Alignment.topCenter,
            child: Image.asset('img/shop.png'),

          ),

          Container(
            width: 250,
            padding: EdgeInsets.only(left:20, right: 20),
            margin: EdgeInsets.only(top: 20, bottom: 5,left:20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50) ,
              color: Colors.brown.shade100,
              boxShadow: [BoxShadow (
                color: Colors.black,
                blurRadius: 10,
              ),
              ],
            ),


            //padding: const EdgeInsets.only(right: 50,left: 50, top: 40),
            //alignment: Alignment.center,
            child: TextField(
              controller: codigo,
              decoration: const InputDecoration(
                hintText: 'Codigo',
              ),
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.only(left:20, right: 20),
            margin: EdgeInsets.only(top: 5, bottom: 5,left:20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50) ,
              color: Colors.brown.shade100,
              boxShadow: [BoxShadow (
                color: Colors.black,
                blurRadius: 10,
              ),
              ],
            ),

            child: TextField(
              controller: nombre,
              decoration: const InputDecoration(
                hintText: 'nombre',
              ),
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.only(left:20, right: 20),
            margin: EdgeInsets.only(top: 5, bottom: 5,left:20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50) ,
              color: Colors.brown.shade100,
              boxShadow: [BoxShadow (
                color: Colors.black,
                blurRadius: 10,
              ),
              ],
            ),

            child: TextField(
              controller: celular,
              decoration: const InputDecoration(
                hintText: 'celular',
              ),
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.only(left:20, right: 20),
            margin: EdgeInsets.only(top: 5, bottom: 5,left:20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50) ,
              color: Colors.brown.shade100,
              boxShadow: [BoxShadow (
                color: Colors.black,
                blurRadius: 10,
              ),
              ],
            ),

            child: TextField(
              controller: telefono,
              decoration: const InputDecoration(
                hintText: 'telefono',
              ),
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.only(left:20, right: 20),
            margin: EdgeInsets.only(top: 5, bottom: 20,left:20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50) ,
              color: Colors.brown.shade100,
              boxShadow: [BoxShadow (
                color: Colors.black,
                blurRadius: 10,
              ),
              ],
            ),

            child: TextField(
              controller: direccion,
              decoration: const InputDecoration(
                hintText: 'direccion',
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,

            child: ElevatedButton.icon(
              icon: const Icon(Icons.add_circle_outline_sharp),
              label:const Text('Registrar  ') ,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.brown.shade800,
                  padding: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )
              ),
              onPressed: () {
                if(nombre.text.isEmpty || direccion.text.isEmpty || telefono.text.isEmpty || celular.text.isEmpty ){
                  Fluttertoast.showToast(msg: "Ingrese todo los campos",
                      toastLength:Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER
                  );
                }else{
                  datoscliente.doc(codigo.text).set(
                      {
                        "nombre": nombre.text,
                        "direccion": direccion.text,
                        "celular": celular.text,
                        "telefono": telefono.text
                      }
                  );
                  Fluttertoast.showToast(msg: "Datos Guardados",
                    fontSize:20,
                    backgroundColor: Colors.brown.shade500,
                    textColor: Colors.white,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                  );
                }
              },

            ),
          ),

          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.build_circle_outlined),
              label:const Text('Actualizar') ,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.brown.shade800,
                  padding: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )
              ),
              onPressed: () {

                datoscliente.doc(codigo.text).update(
                    {
                      "nombre": nombre.text,
                      "direccion": direccion.text,
                      "celular": celular.text,
                      "telefono": telefono.text
                    }
                );
                Fluttertoast.showToast(msg: "Datos Actualizados",
                  fontSize:20,
                  backgroundColor: Colors.brown.shade500,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                );

              },

            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label:const Text('Eliminar    ') ,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.brown.shade800,
                  padding: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )
              ),

              onPressed: () {
                datoscliente.doc(codigo.text).delete();
                Fluttertoast.showToast(msg: "Datos Eliminados",
                  fontSize:20,
                  backgroundColor: Colors.brown.shade500,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
