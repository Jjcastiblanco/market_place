import 'package:flutter/material.dart';
import 'package:marketplace/negocios.dart';
import 'package:url_launcher/url_launcher.dart';

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
