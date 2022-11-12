import 'package:countries_app/Details.dart';
import 'package:countries_app/countries.dart';
import 'package:countries_app/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Countries()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        disabledColor: Colors.white38,
        cardColor: Colors.white10,
        canvasColor: Colors.white10,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white, fontSize: 18),
          labelSmall: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: const Color(0xff000f24),
      ),
      theme: ThemeData(
        disabledColor: Colors.black38,
        cardColor: Colors.black12,
        canvasColor: const Color(0xfff3f4f8),
        iconTheme: const IconThemeData(color: Color(0xff000f24)),
        textTheme: const TextTheme(
          labelMedium: TextStyle(
              color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(
              color: Color(0xff000f24),
              fontSize: 12,
              fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Color(0xff000f24), fontSize: 18),
          bodySmall: TextStyle(
              color: Color(0xff000f24),
              fontSize: 15,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: Color(0xff000f24),
              fontSize: 15,
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: Color(0xff000f24),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: const Color(0xffffffff),
      ),
      routes: {
        MyHomePage.routeHomePage: (context) => MyHomePage(),
      },
    );
  }
}
