import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(

          appBarTheme:AppBarTheme( backgroundColor: Color(0xFF1D1F21)),
          scaffoldBackgroundColor: Color(0xFF1D1F21),
          textTheme: TextTheme(bodyMedium: TextStyle(color:Colors.white)),

      ),
      home: InputPage(),
    );
  }
}




