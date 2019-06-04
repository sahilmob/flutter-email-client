import 'package:emailapp/models/Contact.dart';
import "package:flutter/material.dart";

import 'ContactManager.dart';
import 'Provider.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;
  final Stream stream;

  ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    // ContactManager manager = Provider.of<ContactManager>(context);

    return StreamBuilder<List<Contact>>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;
            return builder(context, contacts);
        }
      },
    );
  }
}
