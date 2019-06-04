import "package:flutter/material.dart";

import "./ContactListBuilder.dart";
import 'ContactManager.dart';
import 'Overseer.dart';
import 'Provider.dart';
import 'models/Contact.dart';

class ContactsSearchDelegate extends SearchDelegate {
  final manager;

  ContactsSearchDelegate({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    if (query.length < 3) {
      return Center(
        child: Text("Search query must be 3 letters or more"),
      );
    }
    return ContactListBuilder(
      stream: manager.filteredCollection(query: query),
      builder: (context, contacts) {
        return ListView.separated(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, index) {
            Contact _contact = contacts[index];
            return ListTile(
              title: Text(_contact.name),
              subtitle: Text(_contact.email),
              leading: CircleAvatar(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
