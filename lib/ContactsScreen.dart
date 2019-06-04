import 'package:emailapp/Provider.dart';
import 'package:flutter/material.dart';

import "./AppDrawer.dart";
import "./ContactManager.dart";
import "./models/Contact.dart";
import "./ContactsSearchDelegate.dart";
import "./ContactListBuilder.dart";
import "./ContactCounter.dart";
import 'Overseer.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);
    return DefaultTabController(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Contacts"),
            actions: <Widget>[
              ContactCounter(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: ContactsSearchDelegate(),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
              )
            ],
          ),
          drawer: AppDrawer(),
          body: ContactListBuilder(
            stream: manager.contactListNow,
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
          )),
      length: 2,
    );
  }
}
