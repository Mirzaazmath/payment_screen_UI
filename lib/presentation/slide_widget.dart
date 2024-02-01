import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payment_screen_ui/presentation/payment_complete_screen.dart';
class SlideWidget extends StatefulWidget {
  double width;
   SlideWidget({super.key,required this.width});

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  /// for Position
  double _dragPosition=1;
  /// for Completion
  bool isCompleted=false;

///onDragUpdate
  onDragUpdate(DragUpdateDetails details){
    updateDragPosition(details.localPosition.dx);
  }
  ///onDragUpdate
  onDragEnd(DragEndDetails details){
    /// checking if the drag is half done or not
    if(_dragPosition<=widget.width/2){
      /// if no
      _dragPosition=0;
    }else{
      ///if yes
      _dragPosition=widget.width-60;
      onDragComplete();
    }
    setState(() {});
  }
/// When DragCompleted
  onDragComplete(){
    /// using Timer to wait for milliseconds: 400
    Timer(const Duration(milliseconds: 400),(){
      setState(() {
        isCompleted=true;
      });
      /// calling the navigate method to navigate to another screen
      navigate();
    }

    );
  }
/// Navigating to other screen
  navigate(){
   /// after milliseconds: 500
    Timer(const Duration(milliseconds: 500),(){
      Navigator.of(context).push(_createRoute());
    }

    );
  }
/// Updating the drag Position
  void updateDragPosition(double position){
    double newPosition=0;

    if(position<=0){
      newPosition=0;
    }
    else if(position>=widget.width){
      newPosition=widget.width-60;
    }else{
      newPosition=position;
    }

    setState(() {
      _dragPosition=newPosition;
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details)=>onDragUpdate(details),
      onHorizontalDragEnd:  (DragEndDetails details)=>onDragEnd(details),
      child: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          height: isCompleted?100: 60,
          padding:  EdgeInsets.all(isCompleted?20:5),
          width:isCompleted?100: widget.width,
         decoration: BoxDecoration(
           color: Theme.of(context).primaryColor,
           borderRadius: BorderRadius.circular(100)
         ),
         child: isCompleted?const CircleAvatar(
           radius: 25,
           backgroundColor:Color(0xff7fff00),
           child: Icon(Icons.done,color: Colors.black,size: 50,weight: 40,),
         ): Stack(
           alignment: Alignment.center,
           children: [
/// Animated Position
            AnimatedPositioned(
              /// getting _dragPosition from GestureDetector onHorizontalDragUpdate
                left: _dragPosition,
                 duration: const Duration(milliseconds: 300),
                 curve: Curves.linear,
                 child: const  CircleAvatar(
                   radius: 25,
                   backgroundColor:Color(0xffD9D9D9),
                   child: Icon(Icons.arrow_forward,color: Colors.black,),
                 )),
             /// Display Text
             isCompleted?const SizedBox():  const  Text("Swipe to Send",style: TextStyle(color: Colors.white,fontSize: 18),)
           ],
         ),
        ),
      ),
    );
  }
}
/////////////// Custom Route Transition /////////////////
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const PaymentCompleteScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
