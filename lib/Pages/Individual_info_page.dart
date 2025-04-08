import 'package:flutter/material.dart';

class IndividualInfoPage extends StatefulWidget {
  const IndividualInfoPage({super.key});

  @override
  State<IndividualInfoPage> createState() => _IndividualInfoPageState();
}

class _IndividualInfoPageState extends State<IndividualInfoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 9, 184, 18),
            Color.fromARGB(244, 82, 66, 3),
            Color.fromARGB(255, 47, 160, 168),
            Color.fromARGB(255, 2, 40, 145),
            Color.fromARGB(255, 71, 23, 116),
            Color.fromARGB(255, 129, 23, 129),
            Color.fromARGB(255, 112, 10, 10)
          ],
         
        ),
      ),
      child: Column(
        children: [
          Container(
            height: size.height*0.1,
            width: size.width*0.9,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                   color: Colors.white.withOpacity(0.2),
                   width: 0.5, // Adjust the width of the glowing border
                            ),
            ),
            child: Row(
              children: [
                // Image.network(
                //   //image_name,

                // )
              ]
            ),

          )
        ],
        ),
      )
    );
  }
}