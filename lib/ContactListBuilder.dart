import 'package:emailapp/Observer.dart';
import 'package:emailapp/models/Contact.dart';
import "package:flutter/material.dart";

class ContactListBuilder extends StatelessWidget {
  final Function builder;
  final Stream stream;

  ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    // ContactManager manager = Provider.of<ContactManager>(context);

    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (context, List<Contact> data) => builder(context, data),
      onWating: (context) => LinearProgressIndicator(),
    );
  }
}
