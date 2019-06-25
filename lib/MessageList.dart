import 'package:flutter/material.dart';
import "package:flutter_slidable/flutter_slidable.dart";

import 'Message.dart';
import "./screen/MessageDetail.dart";

class MessageList extends StatefulWidget {
  final String title;
  final String status;
  MessageList({this.title, this.status = "foucesd"});

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Message.browse(status: widget.status);
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text("There was an error: ${snapshot.error}");
            var messages = snapshot.data;
            return ListView.separated(
              itemCount: messages.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                Message message = messages[index];
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  key: ObjectKey(message),
                  child: ListTile(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MessageDetail(
                                subject: message.subject,
                                body: message.body,
                              ),
                        ),
                      );
                    },
                  ),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: 'Share',
                      color: Colors.indigo,
                      icon: Icons.share,
                      onTap: () {},
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'More',
                      color: Colors.black45,
                      icon: Icons.more_horiz,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        setState(
                          () {
                            messages.removeAt(index);
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            );
        }
      },
    );
  }
}
