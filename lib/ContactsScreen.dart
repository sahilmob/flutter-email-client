import 'package:flutter/material.dart';

import "./AppDrawer.dart";
import "./ContactManager.dart";
import "./models/Contact.dart";
import "./ContactsSearchDelegate.dart";

class ContactsScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            Chip(
              backgroundColor: Colors.red,
              label: StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (BuildContext context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ContactsSearchDelegate(manager: manager),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<List<Contact>>(
          stream: manager.contactListNow,
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                ;
                List<Contact> contacts = snapshot.data;
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
            }
          },
        ),
      ),
      length: 2,
    );
  }
}
