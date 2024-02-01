import 'package:flutter/material.dart';
import 'package:payment_screen_ui/presentation/home_screen.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xff292D32),
      ),
      home:const  HomeScreen(),
    );
  }
}
