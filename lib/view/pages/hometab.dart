import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini/controller/homeprovider.dart';
import 'package:mini/function/function.dart';
import 'package:mini/model/model.dart';
import 'package:mini/view/pages/details.dart';
import 'package:mini/view/pages/edit.dart';
import 'package:provider/provider.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllTransaction();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 56, 86),
        centerTitle: true,
        title: const Text("TRANSACTIONS"),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Consumer<HomeProvider>(
                  builder: (context, Provider, child) => 
                  TextFormField(
                    onChanged: (value) {
                        Provider.search= value;
                      Provider.searchResult(value);
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 123, 117, 117),
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      labelText: "Search Here....",
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Your Current Balance:",style: TextStyle(fontWeight: FontWeight.w500),),
                Consumer<HomeProvider>(
                  builder: (context, provider, child) {
                    double currentBalance = provider.bal();
                    return Text(
                      currentBalance.toString(),
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 1, 66, 120)),
                    );
                  },
                ),
                Expanded(
                  child: Consumer<HomeProvider>(
                    builder: (context, Provider, child) => 
                     ValueListenableBuilder(
                      valueListenable: transactionListNotifier,
                      builder: (BuildContext ctx, List<transactionmodel> srlist, Widget? child) {
                        final display = Provider.search.isNotEmpty ? Provider.searchList : srlist;
                        return display.isEmpty ? Lottie.asset('assets/anm1.json') : 
                        ListView.builder(
                          itemBuilder: (context, index) {
                            final data = display[index];
                            return GestureDetector(
                              onTap: () { 
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Details(
                                  decr: data.discription, 
                                  type: data.type,
                                  amount: data.amount, 
                                  date: data.date, 
                                  index: index)));
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(data.discription, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                                          const SizedBox(height: 10,),
                                          Text(data.date, style: const TextStyle(fontWeight: FontWeight.w500),),
                                          Text(
                                            data.type,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: data.type == "INCOME" ? Colors.green : data.type == "EXPENCE" ? Colors.red : Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(data.amount, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 25),),
                                          Row(
                                            children: [
                                              IconButton(onPressed: (){
                                                delete(index,context);
                                               Provider.bal();
                                              }, 
                                              icon: const Icon(Icons.delete) ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Edit(
                                                    index : index,
                                                    decr: data.discription, 
                                                    type: data.type, 
                                                    amount: data.amount, 
                                                    date: data.date,)));
                                                },
                                                icon: const Icon(Icons.edit, size: 20,),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: display.length,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
delete(int index, BuildContext context){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Column(
          children: [
            Text("DELETE"),
            Text("ARE U SURE WANT TO DELETE THIS TRANSACTION",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),textAlign: TextAlign.center,),
          ],
        ),
        actions: [
          ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 3, 45, 79)),),
                  onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("CANCEL",)),
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 3, 45, 79))),
                  onPressed: (){
                  deleteTransaction(index);
                  Navigator.pop(context);

                }, child: const Text("DELETE",)),
        ],
      );
    },);
  }
}