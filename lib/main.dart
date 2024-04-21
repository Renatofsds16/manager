import 'package:flutter/material.dart';
import 'package:manager/firebase_options.dart';
//import 'package:manager/pages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manager/pages/Login.dart';
/*import 'package:firebase_auth/firebase_auth.dart';*/



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true
        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      )
  );
}