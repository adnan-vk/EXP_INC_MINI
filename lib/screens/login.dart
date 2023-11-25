import 'package:flutter/material.dart';
import 'package:mini/screens/homeTab.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Login Page"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height*0.4,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 70
                ),
                child: Image.asset('assets/logo 2.png'),
              ),
           decoration: BoxDecoration(
            // color: Colors.red
           ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height*0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 167, 185, 199),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          hintText: "user id"
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          hintText: "password"
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>hometab()));
                          }, 
                        child: Text('login',style: TextStyle(color: Colors.black),))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )


      // SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Container(
      //     alignment: Alignment.bottomCenter,
      //     color: Color.fromARGB(255, 158, 201, 236),
      //     child: Padding(
      //     padding: const EdgeInsets.all(10),
      //     child: Column(
      //       children: [
      //         Image.asset('assets/logo 2.png'),
      //         SizedBox(
      //           height: 150,
      //         ),
      //         TextFormField(
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(),
      //             hintText: "User id"
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         TextFormField(
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(),
      //             hintText: "Password",
                  
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         ElevatedButton(onPressed: (){
      //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>hometab()));
      //         }, 
      //         child: Text("Login")),
      //       ],
      //     ),
      //   ),
      //   ),
      // ),
    );
  }
}