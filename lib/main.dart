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
        cardColor: Colors.white10,
        canvasColor: Colors.white10,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white, fontSize: 25),
          labelSmall: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: const Color(0xff000f24),
      ),
      theme: ThemeData(
        cardColor: Colors.black12,
        canvasColor: const Color(0xfff3f4f8),
        iconTheme: const IconThemeData(color: Color(0xff000f24)),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Color(0xff000f24), fontSize: 25),
          bodySmall: TextStyle(
              color: Color(0xff000f24),
              fontSize: 17,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              color: Color(0xff000f24),
              fontSize: 17,
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
        DetailPage.routeDetailPage: (context) => DetailPage()
      },
    );
  }
}
