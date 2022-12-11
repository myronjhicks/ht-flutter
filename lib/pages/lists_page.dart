import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hicks_techniques/main.dart';
import 'package:hicks_techniques/models/ListPageData.dart';
import 'package:hicks_techniques/pages/list_page.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 3.0),
        itemCount: 34,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListPage(
                            data: ListPageData(
                                listKey: index + 1, title: 'HFWL ${index + 1}'),
                          )));
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
                child: Card(
                  color:
                      Colors.accents[Random().nextInt(Colors.accents.length)],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Center(child: Text('HFWL ${index + 1}')),
                    ),
                  ),
                )),
          );
        });
  }
}
