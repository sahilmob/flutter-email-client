import "package:flutter/material.dart";

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
      home: MyHomePage(title: "Flutter Demo Home Page"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  var messsages = const [
    "My first message",
    "My second message",
    "You won lottery",
    "You should read this message",
    "You won lottery again",
  ];
  MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: messsages.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var title = messsages[index];
          return ListTile(
            title: Text(title),
            subtitle: Text(
                "Subtitle which is very very long so everyone can read it, seet it"),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text("SM"),
            ),
          );
        },
      ),
    );
  }
}
