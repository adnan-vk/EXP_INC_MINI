import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini/controller/addprovider.dart';
import 'package:mini/controller/bottomprovider.dart';
import 'package:mini/controller/editprovider.dart';
import 'package:mini/controller/homeprovider.dart';
import 'package:mini/controller/loginprovider.dart';
import 'package:mini/model/model.dart';
import 'package:mini/view/pages/splash.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LoginProvider()),
        ChangeNotifierProvider(create: (context)=>EditProvider()),
        ChangeNotifierProvider(create: (context)=>HomeProvider()),
        ChangeNotifierProvider(create: (context)=>AddProvider()),
        ChangeNotifierProvider(create: (context)=>BottomProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}