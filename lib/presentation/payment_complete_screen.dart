
import 'package:flutter/material.dart';
class PaymentCompleteScreen extends StatelessWidget {
  const PaymentCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const  Spacer(),
          Center(
            child: Hero(
              tag: "Completed",
              child: CircleAvatar(
                radius: 75,
                backgroundColor:  Theme.of(context).primaryColor,
                child:const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xff7fff00),
                  child: Icon(Icons.done,color: Colors.black,size: 50,weight: 40,),
                ) ,
              ),
            ),
          ),
         const  SizedBox(height: 50,),
          const  Text("Your Transaction is Successfully Completed",style:  TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,),
         const  Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: double.infinity,
              padding:const  EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color:const Color(0xff7fff00), ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(100)
              ),
              alignment: Alignment.center,
              child: const   Text("Close",style:  TextStyle(color: Colors.white,fontSize: 20),),

            ),
          )

        ],
      ),
    );
  }
}
