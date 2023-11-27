import 'package:flutter/material.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    gotoLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/logo 2.png',height: height*0.3,)
            ],
          )
        ),
      ),
    );

    // dispose(){     
    //   super.dispose();
    // }
  }
  Future <void> gotoLogin()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
  }
}