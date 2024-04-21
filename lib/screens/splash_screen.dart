import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_english_pronunciation_app/screens/words_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WordsScreen() )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
          childWidget: const Center(
            child:  Text("HRafa", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Bandits'),),
          ),
          duration: const Duration(milliseconds: 1500),
          animationDuration: const Duration(milliseconds: 1000),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: const WordsScreen(),
        );
  }
}