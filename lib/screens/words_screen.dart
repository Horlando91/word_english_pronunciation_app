import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_english_pronunciation_app/provider/word_provider.dart';
import 'package:word_english_pronunciation_app/widgets/info_words.dart';
import 'package:word_english_pronunciation_app/widgets/information_search.dart';
import 'package:word_english_pronunciation_app/widgets/input_search.dart';
import 'package:word_english_pronunciation_app/widgets/interaction_play.dart';


class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key});

  void handleClick(int item, BuildContext context){
    switch (item) {
      case 0:
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
            shape: Border.all(color: const Color.fromARGB(255, 0, 0, 0), strokeAlign: 2),
            title: const Text('Uso'),
            content: const Text("Debe buscar una sola palabra. En ocasiones algunas "
                                "palabras no tendrán audio o carecerán de información."),
          )
          )
        );
        break;
      default:
    }
  }
  
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
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) => handleClick(value, context),
            itemBuilder:  ( context ) => [
              const PopupMenuItem<int>(value: 0, child: Text("Information"),)
            ]
          
          )
        ],
        title: const Text("English pronunciation words", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    InputSearch(
                      onValue: wordProvider.showWord,
                    ),
                    const SizedBox(height: 40,),
                    InteractionPlay(urlAudio: wordProvider.word!.audio),
                    const SizedBox(height: 30,),
                    InfoWords(descriptionWord: "Word", infoWord: wordProvider.word!.wordSearch),
                    InfoWords(descriptionWord: "Phonetics", infoWord: wordProvider.word!.phonetics!),
                    const SizedBox(height: 5,),
                    InformationSearch(searchInfo: "Definition", searchInfoDescription: wordProvider.word!.definition!),
                    const SizedBox(height: 20,),
                    InformationSearch(searchInfo: "Example", searchInfoDescription: wordProvider.word!.example!),
                ],
          ),
        )
      )
    );
  }
}