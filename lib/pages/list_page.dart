import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    print(widget.data.listKey);
    setState(() {
      _items = data[widget.data.listKey.toString()]['items'];
    });
  }

  @override
  void initState() {
    print("In initState");
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data.title)),
      body: Center(child: Text(_items.length.toString())),
    );
  }
}
