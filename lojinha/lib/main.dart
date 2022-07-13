import 'package:flutter/material.dart';
import 'package:lojinha/src/auth/sing_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lojinha',
      theme: ThemeData(
       
        primarySwatch: Colors.green,
      ),
      home: const SignInScreen(),
  
    );
  }
}
