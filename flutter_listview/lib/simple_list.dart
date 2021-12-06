import 'package:flutter/material.dart';
import 'package:flutter_listview/long_list.dart';
import 'package:flutter_listview/long_list_with_separator.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('This is a simple list'),
          ),
          GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LongList()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Click here to view a long list'),
              )),
          GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LongListWithSeparator()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Click here to view a list with separators'),
              )),
        ],
      ),
    );
  }
}
