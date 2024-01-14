

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/sign_In.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  TextEditingController citycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(

              onTap: (){
                showDialog(
                    context: context,
                    builder: (context)=>AlertDialog(
                      title: Text(
                        "Are you want to close this Application"
                      ),
                      actions: [
                        TextButton(
                            onPressed: (){

                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(builder: (context)=>SignIn())
                              // );
                            },
                            child: Text("Yes")
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("No")
                        )
                      ],
                    )
                );
              },

                child: Icon(Icons.logout)
            ),
          )
        ],
      ),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(20),
           child: TextFormField(
             controller: citycontroller,
             decoration: InputDecoration(
               labelText: "Enter City Name",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10)
               )
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(5),
           child: Container(
             width: 250,
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30)
                 )
               ),
                 onPressed: (){},
                 child: Padding(
                   padding: const EdgeInsets.all(10),
                   child: Text("Search",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),),
                 )
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(20),
           child: Container(
             width: 250,
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30)
                 )
               ),
                 onPressed: (){},
                 child: Padding(
                   padding: const EdgeInsets.all(10),
                   child: Text("Forecast",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),),
                 )
             ),
           ),
         )
       ],
     ),

    );
  }
}
