import 'package:flutter/material.dart';

class InformationSearch extends StatelessWidget {
  final String searchInfo;
  final String searchInfoDescription;

   InformationSearch({
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
            Text(searchInfo),
            SizedBox(height: 10,),
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
    return Container(
      padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(18)
        ),
        child: 
            Text(infoSearch)
      );
  }
}