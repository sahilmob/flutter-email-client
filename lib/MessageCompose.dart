import "package:flutter/material.dart";

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                labelText: "To",
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                labelText: "Subject",
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                labelText: "Body",
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              maxLines: 8,
            ),
          ),
        ],
      )),
    );
  }
}
