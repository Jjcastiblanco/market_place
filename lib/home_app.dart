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

import 'filtroActividad.dart';
import 'filtroProducto.dart';

class home_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Market Place Bienvenido(a) "),
            backgroundColor:Colors.blue.shade900 ,
          ),
          body: ListView(
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  color: Colors.blue.shade50,
                  child: ElevatedButton(
                    child: const Text(
                      'Clientes',

                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => clientes()),
                      );
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.blue.shade50,

                  child: ElevatedButton(

                    child: const Text(
                      'Negocios Registrados',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => negocios()),
                      );
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.blue.shade50,

                  child: ElevatedButton(

                    child: const Text(
                      'Buscar Negocio por Nombre',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Buscar()),
                      );
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.blue.shade50,

                  child: ElevatedButton(

                    child: const Text(
                      'Buscar Negocios por Actividad (1,2)',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Buscar_por_tipo()),
                      );
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.blue.shade50,

                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'Productos Ofrecidos',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FiltroProducto()),
                      );
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.blue.shade50,

                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'Filtro por Tipo de Negocio',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FiltroCategoria()),
                      );
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.blue.shade50,

                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'Gestión de Clientes (C.R.U.D)',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GestionClientes()),
                      );
                    },
                  ))
            ],
          )
      ),
    );
  }
}
