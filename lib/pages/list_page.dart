import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hicks_techniques/widgets/flash_card.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../models/ListPageData.dart';

class ListPage extends StatefulWidget {
  final ListPageData data;
  const ListPage({this.data});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List _items = [];
  int index = 0;
  AutoScrollController _controller;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[widget.data.listKey.toString()]['cards'];
    });
  }

  Future _scrollToCounter() async {
    await _controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _controller.highlight(index);
  }

  Widget _cardListItemBuilder(BuildContext context, int index) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _controller,
      index: index,
      child: FlipCard(
        front: FlashCard(
          imageUrl: _items[index]['front'],
          onNextPage: nextPage,
          onPrevPage: prevPage,
        ),
        back: FlashCard(
          imageUrl: _items[index]['back'],
          onNextPage: nextPage,
          onPrevPage: prevPage,
        ),
      ),
    );
  }

  Future nextPage() {
    setState(() => index = (index + 1) % _items.length);
    return _scrollToCounter();
  }

  Future prevPage() {
    setState(() => index = (index - 1) % _items.length);
    return _scrollToCounter();
  }

  @override
  void initState() {
    super.initState();
    readJson();
    _controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.horizontal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.data.title)),
        body: Container(
          alignment: Alignment.center,
          height: 600,
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: _items.length,
            itemExtent: 425.0,
            itemBuilder: _cardListItemBuilder,
          ),
        ));
  }
}
