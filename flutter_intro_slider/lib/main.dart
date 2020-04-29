import 'package:flutter/material.dart';
import 'package:flutterintroslider/each_page.dart';
import 'indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State{
  final controller = PageController();

  final messages = ["First Screen", "Second Screen", "Third Screen"];
  final images = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg'
  ];

  int numberOfPages=3;
  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Stack(children: <Widget>[
            PageView.builder(
              controller: controller,
              onPageChanged: (index){
                setState(() {
                  currentPage=index;
                });
              },
              itemCount: numberOfPages,
              itemBuilder: (BuildContext context, int index) {
                bool showSkip = true;
                if (index == 2) showSkip = false;
                return EachPage(messages[index], images[index]);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(child: Container()),
                    Flexible(
                      child: Indicator(
                        controller: controller,
                      ),
                    ),
                    Flexible(

                      child: (currentPage==numberOfPages-1)?
                      GestureDetector(
                          onTap: (){},
                          child: Center(
                              child: RaisedButton(
                                onPressed: () {},
                                child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold)),
                              ))):
                      GestureDetector(
                          onTap: (){
                            controller.jumpToPage(numberOfPages-1);
                          },
                          child: Center(child: Text("Skip",style: TextStyle(fontWeight: FontWeight.bold),))),
                    )
                  ],),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
