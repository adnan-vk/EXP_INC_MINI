import 'package:flutter/material.dart';
import 'package:mini/screens/add.dart';
import 'package:mini/screens/chart.dart';
import 'package:mini/screens/homeTab.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
int currentindex = 0;

final List _tabs = [
  HomeTab(),
  Add(),
  chart()
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs [currentindex],
      bottomNavigationBar: 
      Container(
        color:  Color.fromARGB(255, 95, 91, 91),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GNav(
            onTabChange: (index){
              setState(() {
                currentindex = index;
              });
            },
            backgroundColor: const Color.fromARGB(255, 95, 91, 91),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blueGrey,
            padding: EdgeInsets.all(13),
            
            gap: 10,
            tabs: [
            GButton(icon: Icons.home_outlined,text: "Home",),
            GButton(icon: Icons.add,text: "Add",),
            GButton(icon: Icons.insert_chart,text: "Chart",),
          ],),
        ),
      )
      // BottomNavigationBar(
      //   currentIndex: currentindex,
      //   onTap: (index){
      //     setState(() {
      //       currentindex = index;
      //     });
      //   } ,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
      //   BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
      //   BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: "chart"),
      //   ]),
      
      
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:mini/screens/add.dart';
// import 'package:mini/screens/chart.dart';
// import 'package:mini/screens/homeTab.dart';
// import 'package:mini/screens/login.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// int currentIndex = 0;

// final List<Widget> _tabs = [
//   HomeTab(),
//   Add(),
//   chart(),
// ];

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _tabs[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.red,
//         selectedFontSize: 15,
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
//           BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: 'Chart'),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Home(),
//   ));
// }
