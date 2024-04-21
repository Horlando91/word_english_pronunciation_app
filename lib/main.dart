import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_english_pronunciation_app/provider/word_provider.dart';
import 'package:word_english_pronunciation_app/screens/splash_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => WordProvider())],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 186, 112)),
      home: const Scaffold(
        body: Center(
          child:SplashScreen(),
        ),
      ),
    ),
    );
  }
}
