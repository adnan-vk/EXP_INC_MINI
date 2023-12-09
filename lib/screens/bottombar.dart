import 'package:flutter/material.dart';
import 'package:mini/screens/add.dart';
import 'package:mini/screens/chart.dart';
import 'package:mini/screens/homeTab.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mini/screens/settings.dart';
int currentindex = 0;
class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}


final List _tabs = [
  const HomeTab(),
  const MyChart(),
  const Settings(),
];

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width; 
    return Scaffold(
      body: _tabs [currentindex],
      bottomNavigationBar: 
      Container(
        width: size*1,
        color:  const Color.fromARGB(255, 3, 45, 79),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: GNav(
            onTabChange: (index){
              setState(() {
                currentindex = index;
              });
            },
            backgroundColor:  const Color.fromARGB(255, 3, 45, 79),
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.yellow,
            padding: const EdgeInsets.all(13),
            gap: 10,
            tabs: const [
            GButton(icon: Icons.home_outlined,text: "Home",),
            GButton(icon: Icons.insert_chart_outlined,text: "Chart",),
            GButton(icon: Icons.settings_outlined,text: "Settings",),
          ],),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 30,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Add()));
          },
          child: Icon(Icons.add,color: Colors.black,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}