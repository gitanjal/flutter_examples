import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var responseBody = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /*
              * Button to get all tasks
              * */
              TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    var response = await http
                        .get('https://jsonplaceholder.typicode.com/todos');
                    print(response.body);

                    setState(() {
                      isLoading = false;
                      responseBody = response.body;
                    });
                  },
                  child: Text('Get request(All Items)')),

              /*
              * Button to get a particular task
              * */
              TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    var response = await http
                        .get('https://jsonplaceholder.typicode.com/todos/3');
                    print(response.body);

                    setState(() {
                      isLoading = false;
                      responseBody = response.body;
                    });
                  },
                  child: Text('Get request(Single Item by ID)')),

              /*
              * Button to post a new task
              * */
              TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    Map<String, String> headers = {
                      'Content-Type': 'application/json; charset=UTF-8',
                    };

                    Map<String, String> dataToSend = {
                      'userId': '1',
                      'title': 'Hello World',
                      'completed': 'false'
                    };

                    var response = await http.post(
                        'https://jsonplaceholder.typicode.com/todos',
                        headers: headers,
                        body: jsonEncode(dataToSend));
                    print(response.body);

                    setState(() {
                      isLoading = false;
                      responseBody = response.body;
                    });
                  },
                  child: Text('Post request(Add a Todo)')),

              /*
              * Button to update a task
              * */
              TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    Map<String, String> headers = {
                      'Content-Type': 'application/json; charset=UTF-8',
                    };

                    Map<String, String> dataToSend = {
                      'title': 'Hello World',
                      'completed': 'false'
                    };

                    var response = await http.put(
                        'https://jsonplaceholder.typicode.com/todos/2',
                        headers: headers,
                        body: jsonEncode(dataToSend));
                    print(response.body);

                    setState(() {
                      isLoading = false;
                      responseBody = response.body;
                    });
                  },
                  child: Text('Put request(Update a Todo)')),

              /*
              * Button to delete a task
              * */
              TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    var response = await http
                        .delete('https://jsonplaceholder.typicode.com/todos/2');
                    print(response.body);

                    setState(() {
                      isLoading = false;
                      responseBody = response.body;
                    });
                  },
                  child: Text('Delete request( Delete a Todo)')),
              (isLoading) ? CircularProgressIndicator() : Text(responseBody)
            ],
          ),
        ),
      ),
    );
  }
}
