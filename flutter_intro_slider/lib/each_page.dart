import 'package:flutter/material.dart';

class EachPage extends StatefulWidget {

  String message;
  String image;
  bool showSkip;

  EachPage(this.message, this.image, this.showSkip);

  @override
  _EachPageState createState() => _EachPageState();

}

class _EachPageState extends State<EachPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                widget.image,
                fit: BoxFit.scaleDown,
                width: 200,
                height: 200,),
              Text(widget.message)
            ],
          ),
        ),
      ),
    );
  }
}
