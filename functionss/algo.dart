import 'package:dsa_app/algorithms/alogoriths.dart';
import 'package:flutter/material.dart';
import 'package:dsa_app/constants/color.dart';

class Algo extends StatelessWidget {
  const Algo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Algorithms()),
                );
              },
            child: 
            Container(
              height: MediaQuery.of(context).size.height/8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: customcolor.bglight1,
                borderRadius: BorderRadius.circular(6),
              
            ),
            child: Padding(padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.storage,color: Colors.white,size: 20,),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text('Algorithms',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
                    SizedBox(height: 2,),
                    Text('Algorithms are step-by-step procedures or sets of rules for',style: TextStyle(fontSize: 14,color: Colors.white60),),
                  ],
                ),
                SizedBox(width: 10,),
                Icon(Icons.keyboard_double_arrow_right,color: Colors.white,size: 20,),
              ],
            ),),

            ),
            );
 
  }
}