import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/buscar.dart';
import 'package:marketplace/buscar_por_tipo.dart';
import 'dart:convert';

import 'package:marketplace/clientes.dart';
import 'package:marketplace/negocios.dart';

class home_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Bienvenido(a)"),
          ),
          body: ListView(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'CLIENTES',
                      style: TextStyle(fontSize: 18, color: Colors.white38),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => clientes()),
                      );
                    },
                  )),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'NEGOCIOS',
                      style: TextStyle(fontSize: 18, color: Colors.white38),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => negocios()),
                      );
                    },
                  )),
              Container(
                  padding: const EdgeInsets.all(50),
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'BUSCAR',
                      style: TextStyle(fontSize: 18, color: Colors.white38),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Buscar()),
                      );
                    },
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: const Text(
                      'BUSCAR POR SERVICIOS ',
                      style: TextStyle(fontSize: 18, color: Colors.white38),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Buscar_por_tipo()),
                      );
                    },
                  )),
            ],
          )
      ),
    );
  }
}
