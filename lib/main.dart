import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:examen3/consultar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nombre = TextEditingController();
  TextEditingController clave = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController proveedor = TextEditingController();

  create() async {
    try {
      await FirebaseFirestore.instance
          .collection("producto")
          .doc(clave.text)
          .set({
        "clave": clave.text,
        "nombre": nombre.text,
        "precio": precio.text,
        "marca": marca.text,
        "proveedor": proveedor.text
      });
      // ignore: avoid_print
      print("producto registrado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  update() async {
    try {
      await FirebaseFirestore.instance
          .collection("producto")
          .doc(clave.text)
          .update({
        "clave": clave.text,
        "nombre": nombre.text,
        "precio": precio.text,
        "marca": marca.text,
        "descripcion": proveedor.text
      });
      // ignore: avoid_print
      print("Se actualizaron los datos");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  delete() async {
    try {
      await FirebaseFirestore.instance
          .collection("producto")
          .doc(clave.text)
          .delete();
      // ignore: avoid_print
      print("Dato Eliminado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Productos"),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: clave,
                decoration: InputDecoration(
                    labelText: "Clave",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: precio,
                decoration: InputDecoration(
                    labelText: "precio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: marca,
                decoration: InputDecoration(
                    labelText: "Marca",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: proveedor,
                decoration: InputDecoration(
                    labelText: "proveedor",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        create();
                        clave.clear();
                        nombre.clear();
                        precio.clear();
                        marca.clear();
                        proveedor.clear();
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Create")),
                  ElevatedButton(
                      onPressed: () {
                        update();
                        clave.clear();
                        nombre.clear();
                        precio.clear();
                        marca.clear();
                        proveedor.clear();
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.purple),
                      child: const Text("Update")),
                  ElevatedButton(
                      onPressed: () {
                        delete();
                        clave.clear();
                        nombre.clear();
                        precio.clear();
                        marca.clear();
                        proveedor.clear();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("Delete")),
                ],
              ),
              const Consulta(),
            ],
          ),
        ));
  }
}
