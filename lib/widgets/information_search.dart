import 'package:flutter/material.dart';

class InformationSearch extends StatelessWidget {
  final String searchInfo;
  final String searchInfoDescription;

   const InformationSearch({
    super.key,
    required this.searchInfo,
    required this.searchInfoDescription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         
          children: [
            Text(searchInfo, style: const TextStyle(fontFamily: 'Bandits', fontSize: 25),),
            const SizedBox(height: 10,),
            _CardInfo(searchInfoDescription)
          ]
        ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  final String infoSearch;
  const _CardInfo(this.infoSearch);

  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.of(context).size.width;

    return Container(
                padding: const EdgeInsets.all(8),
                width: width,
                decoration: BoxDecoration(
                            boxShadow: [
                                 BoxShadow(
                                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.25),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(2, 2),
                                  ),
                                 BoxShadow(
                                    color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(-2, -2),
                                  ),
                                ],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromARGB(255, 255, 255, 255)
                          ),
                          child:Text(infoSearch, style: const TextStyle(color: Color.fromARGB(255, 32, 28, 28),),)
      );
  }
}