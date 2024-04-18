import 'package:flutter/material.dart';

class InteractionPlay extends StatelessWidget {
  const InteractionPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(),
        color: const Color.fromARGB(68, 158, 158, 158)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/boton-de-play.png", scale: 6,),
            SizedBox(width: 15,),
            Image.asset("assets/volumen.png", scale: 6,),
             SizedBox(width: 15,),
            Image.asset("assets/tortuga-marina.png", scale: 6,)
          ]
          ), 
        ),
      );
  }
}