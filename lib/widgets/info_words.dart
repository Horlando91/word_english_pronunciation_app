import 'package:flutter/material.dart';

class InfoWords extends StatelessWidget {
  final String infoWord;
  final String descriptionWord;
   const InfoWords({
    super.key,
    required this.descriptionWord,
    required this.infoWord
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$descriptionWord: ", style: const TextStyle(fontFamily: 'Bandits', fontSize: 23, ),),
          Text(infoWord)
        ],
      )
    );
  }
}