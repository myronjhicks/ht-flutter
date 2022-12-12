import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hicks_techniques/widgets/flash_card.dart';

import '../models/ListPageData.dart';

class ListPage extends StatefulWidget {
  final ListPageData data;
  const ListPage({this.data});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[widget.data.listKey.toString()]['items'];
    });
  }

  Widget _cardListItemBuilder(BuildContext context, int index) {
    return FlipCard(
        front: FlashCard(
            imageUrl:
                "https://hickstechniques.s3.amazonaws.com/HFWL-1-34/${_items[index]['key']}.jpg"),
        back: FlashCard(
            imageUrl:
                "https://hickstechniques.s3.amazonaws.com/HFWL-1-34/${_items[index]['back']}.jpg"));
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.data.title)),
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _items.length,
          itemExtent: 425.0,
          itemBuilder: _cardListItemBuilder,
        ));
  }
}
