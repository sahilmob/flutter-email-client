import 'dart:convert';
import "package:http/http.dart" as http;

import 'package:flutter/material.dart';

import 'Message.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({this.title});

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messsages = const [];

  Future loadMessageList() async {
    http.Response res =
        await http.get("http://www.mocky.io/v2/5ceaa7c23300004c2a7c387e");
    String content = res.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((m) => Message.fromJson(m)).toList();
    setState(() {
      messsages = _messages;
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
          Message message = messsages[index];
          return ListTile(
            title: Text(message.subject),
            subtitle: Text(
              message.body,
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
