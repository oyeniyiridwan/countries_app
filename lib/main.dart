import 'package:countries_app/Details.dart';
import 'package:countries_app/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: Colors.white, fontSize: 25),
            bodySmall: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          scaffoldBackgroundColor: const Color(0xff000f24),
          shadowColor: Colors.transparent),
      routes: {
        MyHomePage.routeHomePage: (context) => MyHomePage(),
        DetailPage.routeDetailPage: (context) => DetailPage()
      },
    );
  }
}
