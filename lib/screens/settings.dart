import 'package:flutter/material.dart';
import 'package:mini/screens/about.dart';
import 'package:mini/screens/login.dart';
import 'package:mini/screens/privacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
        centerTitle: true,
        title: const Text("SETTINGS"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: height*1,
          color: Colors.grey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img.jpg'),
                        radius: 40,
                      ),SizedBox(width: 15,),
                      Text("ADNAN",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w900),),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
      
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                        },
                        child: const Card(
                          color: Color.fromARGB(255, 95, 91, 91),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(Icons.info_outline,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("About This App",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacy()));
                        },
                        child: const Card(
                          color: Color.fromARGB(255, 95, 91, 91),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(Icons.privacy_tip_outlined,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("Privacy And Security",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          signout(context);
                        },
                        child: const Card(
                          color: Color.fromARGB(255, 95, 91, 91),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(Icons.logout_outlined,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("Logout",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset("assets/logo 2.png",width: 150,),
              )
            ],
          ),
        ),
      ),
    );
  }
  signout(BuildContext ctx) async{
    final sharedpre=await SharedPreferences.getInstance();
    await sharedpre.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const Login()), (route) => true,);

  }
}