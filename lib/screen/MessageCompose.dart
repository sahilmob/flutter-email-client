import "package:flutter/material.dart";

import "../Message.dart";

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to;
  String subject;
  String body;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: TextFormField(
                  validator: (value) =>
                      !value.contains("@") ? "To must be a valid email" : null,
                  decoration: InputDecoration(
                    labelText: "To",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onSaved: (value) => to = value),
            ),
            ListTile(
              title: TextFormField(
                  validator: (value) {
                    int len = value.length;
                    if (len <= 0) {
                      return "Subject must not be empty";
                    } else if (len < 4) {
                      return "Subject must not be less than 4 charachters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Subject",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onSaved: (value) => subject = value),
            ),
            ListTile(
              title: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Body",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  maxLines: 8,
                  onSaved: (value) => body = value),
            ),
            ListTile(
              title: RaisedButton(
                  child: Text("Send"),
                  onPressed: () {
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();
                      Message message = Message(subject: subject, body: body);
                      Navigator.pop(context, message);
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}
