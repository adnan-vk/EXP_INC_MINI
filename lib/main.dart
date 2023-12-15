import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini/model/model.dart';
import 'package:mini/screens/splash.dart';
const savekeyname = "user login";
Future<void> main(List<String> args)async {
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(transactionmodelAdapter().typeId)){
    Hive.registerAdapter(transactionmodelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}