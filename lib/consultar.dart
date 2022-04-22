import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestone.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Consulta extends StatefulWidget {
  const Consulta({Key? key}) : super(key: key);

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("producto").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        QueryDocumentSnapshot x = snapshot.data!.docs[i];
                        return ListTile(
                          leading: Text(x['clave']),
                          title: Text(x["nombre"]),
                          subtitle: Text("precio:" +
                              x['precio'] +
                              "proveedor: " +
                              x['proveedor']),
                          trailing: Text(x['marca']),
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
