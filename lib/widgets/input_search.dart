import 'package:flutter/material.dart';
import 'package:word_english_pronunciation_app/config/helpers/get_data_word.dart';
import 'package:word_english_pronunciation_app/provider/word_provider.dart';

class InputSearch extends StatelessWidget {

  final ValueChanged<String> onValue;

  const InputSearch({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {

    final focusNode = FocusNode();
    final callWordProvider = WordProvider();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),

    );

    final inputDecoration = InputDecoration(
      hintText: "Ex: word",
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      
      filled: true,
      
      suffixIcon:  Image.asset("assets/lupa.png",scale: 12,)
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 5.0,
            shadowColor: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25),
           child: TextFormField(
            onTapOutside: (event)=>{
              focusNode.unfocus()
            },
          
            focusNode: focusNode,
            decoration: inputDecoration,
            onFieldSubmitted: (value){
            
              //GetDataWord().getData(value);
              //callWordProvider.showWord(value);
              onValue(value);
              
            },
        ),
           
            
            )
          
        ),
      ],
    );
  }
}