import 'package:countries_app/Services/countries.dart';
import 'package:countries_app/View/Screens/home_page.dart';
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
    final themeProvider = Provider.of<Countries>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.isDarkMode ? ThemeMode.system : ThemeMode.dark,
      darkTheme: ThemeData(
        bottomAppBarColor: Colors.white70,
        disabledColor: Colors.white70,
        cardColor: Colors.white10,
        canvasColor: Colors.white10,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
              color: Colors.white,
              fontSize: 25,
              fontFamily: "ElsieSwashCaps",
              fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: const Color(0xff000f24),
      ),
      theme: ThemeData(
        disabledColor: Colors.black54,
        cardColor: Colors.black12,
        bottomAppBarColor: Colors.black87,
        canvasColor: const Color(0xfff3f4f8),
        iconTheme: const IconThemeData(color: Color(0xff000f24)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
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
              fontFamily: "ElsieSwashCaps",
              fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: const Color(0xffffffff),
      ),
      routes: {
        MyHomePage.routeHomePage: (context) => const MyHomePage(),
      },
    );
  }
}
