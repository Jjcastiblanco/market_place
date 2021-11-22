import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detalleNegocios extends StatefulWidget {
  final dato;
  const detalleNegocios(this.dato,{Key? key}) : super(key: key);
  @override
  _detalleNegociosState createState() => _detalleNegociosState();
}

class _detalleNegociosState extends State<detalleNegocios> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pagina web negocio"),
        ),
        body: Container(
          color: Colors.black12,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          height: 350,
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
                    Image.asset("img/carro1.jpg"),
                    //Image.network(widget.dato)
                    Text("Nombre"),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                        child: ElevatedButton.icon(//onPressed: onPressed, icon: icon, label: label
                          label: const Text("Sitio web"),
                            icon: const Icon(Icons.web,
                            size: 30,
                            color: Colors.grey,),
                          onPressed: () async{
                            if(await canLaunch(widget.dato)){
                              await launch(widget.dato);
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
