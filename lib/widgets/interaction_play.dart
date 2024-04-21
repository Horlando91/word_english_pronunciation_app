import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class InteractionPlay extends StatelessWidget {
  final String urlAudio;

   const InteractionPlay({
    super.key,
    required this.urlAudio
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(),
        gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(179, 241, 122, 4),
                Color.fromARGB(128, 227, 186, 23),
              ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ButtonWidget(urlAudio, 'assets/boton-de-play.png', 6, 'normal'),
            const SizedBox(width: 15,),
            _ButtonWidget(urlAudio, "assets/tortuga-marina.png", 6, 'slow'),
          ]
          ), 
        ),
      );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String urlAudio;
  final String iconData;
  final double scale;
  final String speed;

  _ButtonWidget(this.urlAudio, this.iconData, this.scale, this.speed);

  final player = AudioPlayer();
  
  Future<void> playAudioFromUrl(String url, String speed) async{

    if (url.isEmpty) return;

    if (speed=='slow') {
        await player.setPlaybackRate(0.5);
        await player.play( UrlSource(url) );
    } else {
        await player.play( UrlSource(url) );
    }
  }

  @override
  Widget build(BuildContext context)  {

    return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.white),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 143, 158, 1),
                  Color.fromRGBO(255, 188, 143, 1),
                ],
                
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(50.0),
                
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 39, 39, 39).withOpacity(0.15),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: const Offset(1, 1),
                )
              ]
            ),
            child: IconButton(
              icon: Image.asset(iconData, scale: scale, color: Colors.white,),
              onPressed: () {
                playAudioFromUrl( urlAudio ,speed );
              }
      )
    );
  }
}




