import 'package:emailapp/ContactManager.dart';
import "package:flutter/material.dart";
import "./Provider.dart";

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);
    return Chip(
      backgroundColor: Colors.red,
      label: StreamBuilder<int>(
        stream: manager.contactCounter,
        builder: (BuildContext context, snapshot) {
          return Text(
            (snapshot.data ?? 0).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }
}
