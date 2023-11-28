import 'package:flutter/material.dart';
import 'package:mini/screens/login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("SETTINGS"),
      ),
      body: Container(
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
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img.jpg'),
                      radius: 40,
                    ),SizedBox(width: 15,),
                    Text("User Name",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w900),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Card(
                        color: Color.fromARGB(255, 95, 91, 91),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
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
                      child: Card(
                        color: Color.fromARGB(255, 95, 91, 91),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: Card(
                        color: Color.fromARGB(255, 95, 91, 91),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
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
            ),SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset("assets/logo 2.png",width: 150,),
            )
          ],
        ),
      ),
    );
  }
}