import 'package:dio/dio.dart';
import 'package:word_english_pronunciation_app/domain/entities/word.dart';

class GetDataWord {
  final _dio = Dio();

  Future<Word> getData(String word) async{
    
    final response = await _dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/"+word);
    final dataJson = response.data[0];
  
    print("\n");
    print("word: "+ response.data[0]['word']);
    print("phonetic?: "+ response.data[0]['phonetic']);
    print("audio: "+ response.data[0]['phonetics'][0]['audio']);
    //print("definitions: "+ response.data[0]['meanings'][0]['definitions'][0]['definition']);
    //print("example: "+ response.data[0]['meanings'][0]['definitions'][0]['example']);

    //final word = response.data[0]['phonetics'];
    //final [audio] = word;
    
  

  final def = response.data[0]['meanings'][0]['definitions'];

  //print( def.length );

   for( int i=0; i<def.length; i++ ){
      print( "audio:"+def[i]['definition'] );
    }

  
   
    //print("audio: $audio");
    //print(response.data[0].phonetics[0].text);

    return Word(
      wordSearch: dataJson['word'],
      phonetics: dataJson['phonetic'], 
      audio: _getDataOfJson(dataJson['phonetics'], 'audio'), 
      definition: _getDataOfJson(dataJson['meanings'][0]['definitions'], 'definition'),
      example: "example");
  }


  String _getDataOfJson( json, key){

     for( int i=0; i<json.length; i++ ){
      //print( "audio:"+json[i][key] );
      if (json[i][key].toString().isNotEmpty) {
        return json[i][key];
      }
    }
    return "";
  }
}