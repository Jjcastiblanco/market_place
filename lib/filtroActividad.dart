import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FiltroCategoria extends StatefulWidget {
  const FiltroCategoria({Key? key}) : super(key: key);

  @override
  _FiltroCategoriaState createState() => _FiltroCategoriaState();
}

class _FiltroCategoriaState extends State<FiltroCategoria> {
  TextEditingController filtrar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Filtro por Categoria"),
        ),
        body: Center(
          child: SizedBox(width: 250,child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller:filtrar,
                  onChanged: (value){
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      hintText: "Ingrese dato a buscar"
                  ),
                ),
              ),
              Expanded(
                child: DatoFiltro(
                  text: filtrar.text,
                ),
              ),
            ],
          ),),
        ),
      ),
    );
  }
}

class DatoFiltro extends StatelessWidget{
  final String text;

  const DatoFiltro({Key? key, required this.text}):super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(text);
    final Stream<QuerySnapshot>filtroConsulta = FirebaseFirestore.instance.collection('negocios').where('categoria',isEqualTo:text).snapshots();
    //final Stream<QuerySnapshot>filtroConsulta = FirebaseFirestore.instance.collection('clientes').where('idioma',arrayContainsAny:[text.toLowerCase()]).snapshots();

    return StreamBuilder<QuerySnapshot>(
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
                return Container(
                  color: Colors.indigo,
                  margin: EdgeInsets.only(top:6),
                  child: ListTile(
                    title: Text(data['nombre']),
                    subtitle: Text(data['direccion']),
                    leading: Image.network(data['imagen'],width: 100,height: 100),
                  ),
                );
              }
              ).toList()
          );
        }
    );
  }
}