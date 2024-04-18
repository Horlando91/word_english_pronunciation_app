import 'package:flutter/material.dart';
import 'package:word_english_pronunciation_app/config/helpers/get_data_word.dart';
import 'package:word_english_pronunciation_app/domain/entities/word.dart';

class WordProvider extends ChangeNotifier{
  final getDataWord = GetDataWord();

  Word? word = Word(wordSearch: 'bye', phonetics: '/baɪ/', audio: 'https://api.dictionaryapi.dev/media/pronunciations/en/bye-au.mp3"', definition: 'The position of a person or team in a tournament or competition who draws no opponent in a particular round so advances to the next round unopposed, or is awarded points for a win in a league table; also the phantom opponent of such a person or team.', example: 'Craigs Crew plays the bye next week.');

  Future<void> showWord (String wordSearch) async {

    if (wordSearch.isEmpty) return;

    final dataWord = await getDataWord.getData(wordSearch);
    word = dataWord;

    //print("Palabra Buscada" + word!.wordSearch );

    notifyListeners();
  }

}