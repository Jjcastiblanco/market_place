import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/buscar.dart';
import 'package:marketplace/buscar_por_tipo.dart';
import 'dart:convert';

import 'package:marketplace/clientes.dart';
import 'package:marketplace/compra_prod.dart';
import 'package:marketplace/negocios.dart';
import 'package:marketplace/registroClientes.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'filtrarProductos.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';

class home_app extends StatelessWidget {
  final imageList = [
    'img/carro1.jpg',
    'img/blackDays.jpg',
    'img/descarga.jpg',
    'img/market.png',
    'img/shop.png',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.brown.shade200,
          appBar: AppBar(
            title: const Text("Market Place Bienvenido(a) "),
            centerTitle: true,
            backgroundColor: Colors.brown.shade900,
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
          body:
          //Este container es para hacer una galera de imagenes q se pueden desplazar pero no logro q salga junto los otros container,
          // si se deja solo y fura del ListView si funciona, si no se logra sera quitarlo.
          // Container(
          //   child: PhotoViewGallery.builder(
          //     itemCount: imageList.length,
          //     builder: (context, index) {
          //       return PhotoViewGalleryPageOptions(
          //         imageProvider: AssetImage(
          //           imageList[index],
          //         ),
          //         minScale: PhotoViewComputedScale.contained * 0.5,
          //         maxScale: PhotoViewComputedScale.covered * 1,
          //       );
          //     },
          //     scrollPhysics: BouncingScrollPhysics(),
          //     backgroundDecoration: BoxDecoration(),
          //     enableRotation: true,
          //   ),
          // ),
          ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                height: 300,
                child: Image.asset('img/market.png'),
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                height: 200,
                child: Text(
                    'Bienvenido(a) a Market Place, ingresa al menú lateral izquierdo y selecciona una opción',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
                color: Colors.brown.shade100,
                margin: EdgeInsets.all(50),
              ),
            ],
         )
      ),
    );
  }
}
