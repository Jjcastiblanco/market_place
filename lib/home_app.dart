import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/buscar.dart';
import 'package:marketplace/buscar_por_tipo.dart';
import 'dart:convert';

import 'package:marketplace/clientes.dart';
import 'package:marketplace/negocios.dart';
import 'package:marketplace/registroClientes.dart';

import 'filtrarProductos.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';

class home_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown.shade200,
          appBar: AppBar(
            title: const Text("Market Place Bienvenido(a) "),
            centerTitle: true,
            backgroundColor:Colors.brown.shade900 ,
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
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 300,

              child: Image.asset('img/market.png'),
            ),
          //   children: [
          //     Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.all(10),
          //         alignment: Alignment.topLeft,
          //         color: Colors.blue.shade50,
          //         child: ElevatedButton(
          //           child: const Text(
          //             'Clientes',
          //
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => clientes()),
          //             );
          //           },
          //         )),
          //     Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
          //         alignment: Alignment.topLeft,
          //         color: Colors.blue.shade50,
          //
          //         child: ElevatedButton(
          //
          //           child: const Text(
          //             'Negocios Registrados',
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => negocios()),
          //             );
          //           },
          //         )),
          //     Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
          //         alignment: Alignment.topLeft,
          //         color: Colors.blue.shade50,
          //
          //         child: ElevatedButton(
          //
          //           child: const Text(
          //             'Buscar Negocio por Nombre',
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => const Buscar()),
          //             );
          //           },
          //         )),
          //     Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
          //         alignment: Alignment.topLeft,
          //         color: Colors.blue.shade50,
          //
          //         child: ElevatedButton(
          //
          //           child: const Text(
          //             'Buscar Negocios por Actividad (1,2)',
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => const Buscar_por_tipo()),
          //             );
          //           },
          //         )),
          //     Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
          //         alignment: Alignment.topLeft,
          //         color: Colors.blue.shade50,
          //
          //         child: ElevatedButton(
          //           style: TextButton.styleFrom(
          //             primary: Colors.blueAccent,
          //           ),
          //           child: const Text(
          //             'Productos Ofrecidos',
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => const FiltroProducto()),
          //             );
          //           },
          //         )),
          //     Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
          //         alignment: Alignment.topLeft,
          //         color: Colors.blue.shade50,
          //
          //         child: ElevatedButton(
          //           style: TextButton.styleFrom(
          //             primary: Colors.blueAccent,
          //           ),
          //           child: const Text(
          //             'Filtro por Tipo de Negocio',
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => const FiltroCategoria()),
          //             );
          //           },
          //         )),
          //     Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
          //         alignment: Alignment.topLeft,
          //         color: Colors.blue.shade50,
          //
          //         child: ElevatedButton(
          //           style: TextButton.styleFrom(
          //             primary: Colors.blueAccent,
          //           ),
          //           child: const Text(
          //             'Gestión de Clientes (C.R.U.D)',
          //             style: TextStyle(fontSize: 18, color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => const GestionClientes()),
          //             );
          //           },
          //         ))
            ],
         )
      ),
    );
  }
}
