import 'package:flutter/material.dart';

class InfoWords extends StatelessWidget {
  final String infoWord;
  final String descriptionWord;
   InfoWords({
    super.key,
    required this.descriptionWord,
    required this.infoWord
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text("$descriptionWord: $infoWord")
    );
  }
}