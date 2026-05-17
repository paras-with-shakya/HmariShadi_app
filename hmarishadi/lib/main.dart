import 'package:flutter/material.dart';
import 'package:hmarishadi/screens/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Hmarishadi',

      /// 🌞 LIGHT THEME
      theme: ThemeData(
        useMaterial3: true,
        // scaffoldBackgroundColor: Color.fromARGB(237, 220, 55, 96),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(214, 191, 7, 53),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(214, 191, 7, 53),
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ),
      ),

      /// 🌙 DARK THEME
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 24, 43, 79),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 10, 20, 38),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 10, 20, 38),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),

      /// 🔁 Theme switch
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: SplashScreen(
        // title: 'Hmarishadi.com',
        // isDarkMode: isDarkMode,
        // onThemeToggle: toggleTheme,
      ),
    );
  }
}
