import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketplace/registroClientes.dart';

import 'buscar.dart';
import 'buscar_por_tipo.dart';
import 'compra_prod.dart';
import 'filtrarProductos.dart';
import 'filtroActividad.dart';
import 'filtroProducto.dart';
import 'negocios.dart';

class CarritoCompras extends StatefulWidget {
  List lista=[];
  CarritoCompras({required this.lista,});

  @override
  _CarritoComprasState createState() => _CarritoComprasState();
}

class _CarritoComprasState extends State<CarritoCompras> {
  var total;
  CollectionReference registroCompras=FirebaseFirestore.instance.collection("registroCompras");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Carrito de compras"),
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
                  selected: true,
                  //leading: Image.asset("img/fondo.jpg"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Compras()),
                    );
                  },
                ),

              ]
          ),
        ),
        body: Column(
            children: [
              Expanded(
                child: ListView.builder(itemCount: widget.lista.length,
                  itemBuilder: (BuildContext context,i){
                    final item=widget.lista[i][0];
                    return Dismissible(
                      key: Key(item),
                      onDismissed: (direction) {
                        switch (direction) {
                          case DismissDirection.endToStart:
                            widget.lista.removeAt(i);
                            break;
                          case DismissDirection.startToEnd:
                            widget.lista.removeAt(i);
                            break;
                          default:
                        }
                      },
                      background: const _DismissibleContainer(
                        icon: 'eliminar',
                        backgroundColor: Colors.white38,
                        iconColor: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsetsDirectional.only(start: 20),
                      ),
                      confirmDismiss: (direction) async {
                        // if (direction == DismissDirection.endToStart) {
                        //   return false;
                        // } else {
                          return true;
                        //}
                      },

                      movementDuration: Duration(milliseconds: 100),
                      child: ListTile(
                        title: Text(widget.lista[i][0]),
                        subtitle: Text("Precio: "+widget.lista[i][1]),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Builder(
                        builder:(context) {
                          return ElevatedButton.icon( //onPressed: onPressed, child: child)
                              label: Text("Calcular total"),
                              icon: const Icon(Icons.check_circle_outline_sharp,
                                size: 20,
                                color: Colors.blueGrey,),
                              onPressed: () {
                                if (widget.lista.isNotEmpty) {
                                  total = 0;
                                  var num, tt;
                                  for (int i = 0; i <
                                      widget.lista.length; i++) {
                                    num = widget.lista[i][1];
                                    tt = int.parse(num);
                                    total = total + tt;
                                  }
                                  Fluttertoast.showToast(
                                      msg: "El valor a cancelar es de: \$" +
                                          total.toString() + " pesos",
                                      fontSize: 20,
                                      backgroundColor: Colors.amberAccent,
                                      textColor: Colors.black,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER);
                                  //Otra forma de mostrar el mensaje, dejar el que gusten
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context,
                                            "El valor a cancelar es de: \$" +
                                                total.toString() + " pesos"),
                                  );
                                }else
                                {
                                  var prod_add = "No existen productos para calcular valores";
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context, prod_add),
                                  );
                                }
                              }
                          );
                        }
                    ),
                    Container(
                      child: ElevatedButton.icon(
                        label: Text("Efectuar Comprar"),
                        icon: Icon(Icons.payment,color: Colors.green,),
                        onPressed: (){
                          if(widget.lista.isNotEmpty) {
                            //calcula total
                            total = 0;
                            var num, tt;
                            for (int i = 0; i < widget.lista.length; i++) {
                              num = widget.lista[i][1];
                              tt = int.parse(num);
                              total = total + tt;
                            }
                            //envia venta
                            List addVenta = [];
                            for (int i = 0; i < widget.lista.length; i++) {
                              addVenta.add(widget.lista[i][0]);
                            }
                            registroCompras.doc().set({
                              "producto": addVenta,
                              "totalFinal": total.toString()
                            });
                            var prod_add = "Se realizo una compra exitosa por valor de \$" +
                                total.toString();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context, prod_add),
                            );
                          }else
                            {
                              var prod_add = "No existen productos para facturar";
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildPopupDialog(context, prod_add),
                              );
                            }
                        },
                      ),
                    )
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}
class _DismissibleContainer extends StatelessWidget {
  const _DismissibleContainer({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.alignment,
    required this.padding,
  });

  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final Alignment alignment;
  final EdgeInsetsDirectional padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: alignment,
      color: Colors.red,
      curve: standardEasing,
      duration: kThemeAnimationDuration,
      padding: padding,

      child: Material(

        child: Icon(Icons.delete_forever,
          size: 36,
          color: iconColor,
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String text) {
  return AlertDialog(
    title: Text(text),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const <Widget>[
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Volver'),
      ),
    ],
  );
}
