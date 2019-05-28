import 'package:flutter/material.dart';

import "./AppDrawer.dart";
import "./ContactManager.dart";

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
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<List<String>>(
          stream: manager.contactListNow,
          builder: (BuildContext context, snapshot) {
            List<String> contacts = snapshot.data;
            return ListView.separated(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, index) => ListTile(
                    title: Text(contacts[index]),
                  ),
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          },
        ),
      ),
      length: 2,
    );
  }
}
