import 'package:flutter/material.dart';
import '../models/FlashCard.dart';

class SightWordsPage extends StatelessWidget {
  const SightWordsPage({Key key}) : super(key: key);

  Widget _cardListItemBuilder(BuildContext context, int index) {
    return Container(
        alignment: Alignment.topCenter,
        child: Image.network(
          cards[index].imageUrl,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 300,
        child: ListView.builder(
          //scrollDirection: Axis.horizontal,
          itemCount: cards.length,
          itemExtent: 425.0,
          itemBuilder: _cardListItemBuilder,
        ),
      )
    ]);
  }
}
