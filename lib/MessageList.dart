import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({this.title});

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messsages = const [];

  Future loadMessageList() async {
    var content = await rootBundle.loadString("data/messages.json");
    setState(() {
      messsages = json.decode(content);
    });
    print(content);
  }

  void initState() {
    super.initState();
    loadMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messsages.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var message = messsages[index];
          return ListTile(
            title: Text(message['subject']),
            subtitle: Text(
              message['body'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
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
