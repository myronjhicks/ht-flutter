import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  final String imageUrl;

  const FlashCard({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 5,
            child: Container(color: Colors.greenAccent),
          ),
          Row(
            children: [ButtonBar()],
          )
        ],
      ),
    );
  }
}
