import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:html';

void main() async {
  //Inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection("usuarios").doc("1291").set({
    "nome": "Melina", 
    "idade": "28",
  });
  
  /* runApp(MyApp()); */

  DocumentReference ref = await db.collection("noticias").add({
    "titulo": "Ondas de calor",
    "descricao": "texto de exemplo...",
  });

  print("item salvo: " + ref.id);

  db.collection("noticias").doc(" ").set({
    "titulo": "Ondas de calor em São Paulo",
    "descricao": "texto base",
  }
);
DocumentSnapshot snapshot = await db.collection("usuarios").doc("0f1").get();

//  print("Dados:" + snapshot.data.toString());

if (snapshot.data() != null) {
    Map<String, dynamic> dados = snapshot.data as Map<String, dynamic>;
    print("dados: " + dados["nome"] + "idade:" + dados["idade"]);
  }
  QuerySnapshot querySnapshot = await db.collection("usuarios").get();
  print("Dados usuarios: " + querySnapshot.docs.toString());

  for (DocumentSnapshot item in querySnapshot.docs) {
    Map<String, dynamic> dados = item.data as Map<String, dynamic>;
    print("Dados usuarios: " + dados["Nome"] + "-" + dados["idade"]);
  }
  db.collection('usuarios').snapshots().listen((event) {
    for (DocumentSnapshot item in snapshot.data()) {
      Map<String, dynamic> dados = item.data as Map<String, dynamic>;
      print("dados usuarios:" + dados["nome"] + "-" + dados["idade"]);
    }
  },

 /*  runApp(MaterialApp(
    home: MyApp(),
  )); */
  );}