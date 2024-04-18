import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_english_pronunciation_app/provider/word_provider.dart';
import 'package:word_english_pronunciation_app/widgets/info_words.dart';
import 'package:word_english_pronunciation_app/widgets/information_search.dart';
import 'package:word_english_pronunciation_app/widgets/input_search.dart';
import 'package:word_english_pronunciation_app/widgets/interaction_play.dart';


class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final wordProvider = context.watch<WordProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/estados-unidos.png"),
          ),
        ),
        title: const Text("English pronunciation words", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                  children: [
                    const SizedBox(height: 70,),
                    InputSearch(
                      onValue: wordProvider.showWord,
                    ),
                    const SizedBox(height: 70,),
                    const InteractionPlay(),
                    const SizedBox(height: 30,),
                    InfoWords(descriptionWord: "Word", infoWord: wordProvider.word!.wordSearch),
                    InfoWords(descriptionWord: "Phonetics", infoWord: wordProvider.word!.phonetics!),
                    const SizedBox(height: 50,),
                    InformationSearch(searchInfo: "Definition", searchInfoDescription: wordProvider.word!.definition),
                    const SizedBox(height: 20,),
                    InformationSearch(searchInfo: "Example", searchInfoDescription: wordProvider.word!.example),
                ],
          ),
        )
      )
    );
  }
}