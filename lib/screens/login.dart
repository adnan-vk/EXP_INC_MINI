import 'package:flutter/material.dart';
import 'package:mini/main.dart';
import 'package:mini/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
final _userController = TextEditingController();
final _passwordController = TextEditingController();
bool _dataMatched = true;

final _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 45, 79),
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            SizedBox(
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height*0.6,
                width: width * 1,
                decoration: const BoxDecoration(
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
                      top: 30
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Column(
                        children: [
                          const Text('LOGIN',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 14, 51, 82))),
                          const SizedBox(height: 30,),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: _userController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: "User id",labelStyle: const TextStyle(color: Colors.white)
                            ),
                            validator: (value) {
                            if(value == null || value.isEmpty){
                            return "value is  empty";
                            }else{
                            return null;
                            }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: _passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              labelText: "Password",labelStyle: const TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                            if(value == null || value.isEmpty){
                            return "value is  empty";
                            }else{
                            return null;
                            }
                            },
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                checklogin(context);
                              }
                            }, 
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                              vertical: width*0.03,
                              horizontal: height*0.03
                            ),
                            child: const Text('login',style: TextStyle(color: Colors.black),),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  void checklogin(BuildContext ctx)async{
    final _username = _userController.text;
    final _password = _passwordController.text;
    if(_username == "adnan" && _password == "123"){
      final std = await SharedPreferences.getInstance();
      await std.setBool(savekeyname, true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
    }else{
      setState(() {
        _dataMatched = false;
      });
    }
  }
  
}