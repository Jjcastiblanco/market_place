import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/home_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      appBar: AppBar(
        title:const Text("Ingrese a su tienda"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Image.asset('img/carro3.jpg'),
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
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                child: const Text('Ingresar', style: TextStyle(
                  fontSize: 16,
                  color: Colors.white38
                  ),
                ),
                onPressed: (){
                  usu=user.text;
                  pass=password.text;
                  print(usu+"  " +pass);
                  if (usu=="Cesar" && pass=="123456"){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>home_app()),
                    );
                  }
                },
              )
          ),
        ],
      ),
    );
  }
}
