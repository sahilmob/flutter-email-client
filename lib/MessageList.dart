import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({this.title});

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messsages = const [];
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
