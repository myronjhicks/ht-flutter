import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  final String imageUrl;
  final void onPrevPage;
  final void onNextPage;

  const FlashCard({Key key, this.imageUrl, this.onPrevPage, this.onNextPage})
      : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  return onPrevPage;
                },
                icon: Icon(Icons.skip_next),
              ),
              IconButton(
                iconSize: 40,
                onPressed: () => {},
                icon: Icon(Icons.keyboard_voice_outlined),
              ),
              IconButton(
                onPressed: () {
                  return onNextPage;
                },
                icon: Icon(Icons.skip_next),
              )
            ],
          )
        ],
      ),
    );
  }
}
