import 'package:dio/dio.dart';
import 'package:word_english_pronunciation_app/domain/entities/word.dart';

class GetDataWord {
  final _dio = Dio();

  Future<Word> getData(String word) async{
    
    final response = await _dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/$word");
    final dataJson = response.data[0];
  
    return Word(
      wordSearch: dataJson['word'],
      phonetics: _getDataOfJson(dataJson['phonetics'], 'text'), 
      audio: _getDataOfJson(dataJson['phonetics'], 'audio'), 
      definition: _getDataOfJson(dataJson['meanings'][0]['definitions'], 'definition'),
      example: _getDataOfJson(dataJson['meanings'][0]['definitions'], 'example'));
  }

  String _getDataOfJson( json, key){
    const String info="No info available";

    try {
      for( int i=0; i<json.length; i++ ){
      if (json[i][key].toString().isNotEmpty && json[i][key] != null  ) {
        return json[i][key];
      }
    }
    } catch (e) {
      return info;
    }
    return info;
  }
}