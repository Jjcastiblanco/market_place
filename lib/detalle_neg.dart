import 'package:flutter/material.dart';
import 'package:marketplace/negocios.dart';
import 'package:marketplace/registroClientes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'buscar.dart';
import 'buscar_por_tipo.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';

class detalleNegocios extends StatefulWidget {
  final Negocios negocio;
  const detalleNegocios( {required this.negocio});
  @override
  _detalleNegociosState createState() => _detalleNegociosState();
}

class _detalleNegociosState extends State<detalleNegocios> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detalle " + widget.negocio.nombre),
        ),
        drawer: Drawer(
          child: ListView(
            //padding: EdgeInsets.all(20),
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    //color: Color.fromARGB(40, 200, 0, 0)
                      gradient: LinearGradient(colors: [Colors.blueAccent, Colors.black38], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  ),
                  accountName: const Text("Anonimo"),
                  accountEmail: const Text("Anonimo"),
                  currentAccountPicture:Image.asset("img/shop.png"),
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
        body: Container(
          color: Colors.black12,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          height: 400,
          //width: 350,
          child: Center(
            child: Card(
              elevation: 9,
              shadowColor: Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              //color: Colors.amberAccent,
              color: Color.fromARGB(100, 100, 100, 100),
              child: Center(
                child: Column(
                  children: [
                    //Image.asset("img/carro1.jpg"),
                    Image.network(widget.negocio.imagen,width: 200,height: 200),
                    Text("Categoria: "+widget.negocio.categoria),
                    Text("Dirección: "+widget.negocio.direccion),
                    Text("Celular: "+widget.negocio.celular),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                        child: ElevatedButton.icon(//onPressed: onPressed, icon: icon, label: label
                          label: const Text("Sitio web"),
                            icon: const Icon(Icons.web,
                            size: 20,
                            color: Colors.grey,),
                          onPressed: () async{
                            if(await canLaunch(widget.negocio.paginaWeb)){
                              await launch(widget.negocio.paginaWeb);
                            }
                          }//_launchURL,
                        ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(//onPressed: onPressed, icon: icon, label: label
                          label: const Text("Ubicación"),
                          icon: const Icon(Icons.map,
                            size: 20,
                            color: Colors.grey,),
                          onPressed: () async{
                            if(await canLaunch(widget.negocio.paginaWeb)){
                              await launch(widget.negocio.paginaWeb);
                            }
                          }//_launchURL,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
