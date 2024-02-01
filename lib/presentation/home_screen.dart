import 'package:flutter/material.dart';
import 'package:payment_screen_ui/presentation/slide_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// for Amount
  String amount="";
  // for Keypad
  List<List<int>>keyboardList=[[1,2,3],[4,5,6],[7,8,9,],[-1,0,-2]];
  @override
  Widget build(BuildContext context) {
    var width =  MediaQuery.sizeOf(context).width-(padding*2);
    return   Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
///////////// Amount Display  Container //////////////
            Container(
              height: 50,
              width: 200,
              padding:const  EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(100)
              ),
         alignment: Alignment.center,
         child:   Text(amount,style: const TextStyle(color: Colors.white,fontSize: 30),),

            ),
            /////////////// KeyPad UI /////////////////
            for(int i=0;i<keyboardList.length;i++)...[
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    for(int j=0;j<keyboardList[i].length;j++)...[
                      Expanded(
                        child: InkWell(
                          onTap: (){
                        if(amount==""){
                          amount="\$${keyboardList[i][j]}";
                        }
                        else{
                          amount+="${keyboardList[i][j]}";
                        }
                        setState(() {

                        });
                          },
                          child:  SizedBox(
                            height: 80,
                            width: 80,
                            child: Center(child: Text(keyboardList[i][j]==-1?".":keyboardList[i][j]==-2?"<":keyboardList[i][j].toString(),style: const TextStyle(color: Colors.white,fontSize: 30),)),

                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              )
            ],
            /////////////// Slide Widget  /////////////////
            SizedBox(
              height: 150,
              child: Hero(
                tag: "Completed",
                  child: SlideWidget(width: width,)),
            ),
          ],
        ),
      ),
    );
  }
}
double padding=20;