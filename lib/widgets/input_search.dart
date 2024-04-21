import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {

  final ValueChanged<String> onValue;

  const InputSearch({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: "Example: bye",
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      fillColor: Colors.white,
      filled: true,
      suffixIcon: IconButton(
        icon:  Image.asset("assets/lupa.png",scale: 12,),
        onPressed: (){
          final textValue = textController.value.text;
          onValue(textValue);
          focusNode.unfocus();
          
        },
      ));

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
              controller: textController,
              decoration: inputDecoration,
              onFieldSubmitted: (value){
                onValue(value);
                focusNode.unfocus();
              },
          ),  
          )
        ),
      ],
    );
  }
}