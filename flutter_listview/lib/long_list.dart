import 'package:flutter/material.dart';

class LongList extends StatelessWidget {
  List<String> listOfItems=List.generate(20, (index) => 'Sample item $index');
  LongList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listOfItems.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                print('Tapped on item #$index');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listOfItems[index]),
                    Text('Sample subtitle for item #$index'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
