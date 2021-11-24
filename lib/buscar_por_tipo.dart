
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/main.dart';

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

