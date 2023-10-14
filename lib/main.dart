import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ['String', 'Int', 'Double'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Title: ${items[index]}'),
            subtitle: Text('Subtitle: ${items[index]}'),
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Edit or Delete?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Code to edit the selected item
                          Navigator.of(context).pop();
                          // Open a bottom sheet with title and description text of the selected list tile item
                        },
                        child: Text('Edit'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Code to delete the selected item
                          setState(() {
                            items.removeAt(index);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}