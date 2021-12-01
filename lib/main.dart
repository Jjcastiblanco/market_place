import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/home_app.dart';
import 'package:marketplace/registroClientes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final user=TextEditingController();
  final password=TextEditingController();
  String usu='';
  String pass='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,

      appBar: AppBar(
        title:const Text("Market Place Login"),
        backgroundColor: Colors.brown.shade900,
        shadowColor: Colors.black,
        elevation: 50,
        centerTitle: true,

      ),
      body: ListView(

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

            child: TextField(
              controller: user,
              decoration: const InputDecoration(
                hintText: 'Usuario'
              ),
            )
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,

              child: TextField(
                controller: password,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                    hintText: 'Password',
                ),
              )
          ),
          Container(

              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.center,

              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.brown.shade800,
                  padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )
                ),
                child: const Text('Iniciar Sesión', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  ),
                ),
                onPressed: (){
                  usu=user.text;
                  pass=password.text;
                  print(usu+"  " +pass);
                  if (usu=="usuario" && pass=="1234"){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>home_app()),
                    );
                  }
                },
              )
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.brown.shade800,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )
                ),
                child: const Text('Crear Cuenta', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                ),
                onPressed: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> ReCliente()),
                );
                },

              )
          ),
          Container(
              alignment: Alignment.center,

              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.brown.shade800,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )
                ),
                child: const Text('Iniciar sin Cuenta', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,

                ),
                ),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>home_app()),
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}
