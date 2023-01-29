import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_valorant/pages/home_page.dart';
import 'package:flutter_valorant/pages/login_page.dart';
import 'package:flutter_valorant/pages/select_agent_page.dart';
import 'package:flutter_valorant/utils/app_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('images/valorant_background.png'), context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: AppTheme.themeDataBackgroundColor,
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: AppTheme.themeDataBackgroundColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/homePage': (context) => const HomePage(),
        '/selectAgentPage': (context) => const SelectAgentPage(),
      },
    );
  }
}
