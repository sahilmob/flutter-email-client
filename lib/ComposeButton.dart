import "package:flutter/material.dart";

import "./MessageCompose.dart";
import "./Message.dart";

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MessageCompose()),
        );
        if (message != null) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Your message has been sent"),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
    );
  }
}
