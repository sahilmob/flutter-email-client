import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

import 'Message.dart';
import "./MessageDetail.dart";
import "./ComposeButton.dart";

class MessageList extends StatefulWidget {
  final String title;
  MessageList({this.title});

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
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              setState(() {
                future = Message.browse();
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
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
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return Dismissible(
                      onDismissed: (direction) {
                        setState(() {
                          messages.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red[300],
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.trash,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
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
                      ));
                },
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(messages: messages),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("myemail@email.com"),
              accountName: Text("My Name"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/33333226?s=460&v=4"),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Adding new account..."),
                          );
                        });
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.inbox),
                title: Text("Inbox"),
                trailing: Chip(
                  label: Text(
                    "11",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  backgroundColor: Colors.blueGrey,
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.edit),
              title: Text("Draft"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.archive),
              title: Text("Archive"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text("Sent"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text("Trash"),
            ),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.cog),
                  title: Text("Settings"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
