import 'package:flutter/material.dart';

import "./MessageList.dart";

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {},
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Foucsed",
              ),
              Tab(
                text: "Other",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MessageList(status: "foucesd"),
            MessageList(status: "other"),
          ],
        ),
      ),
    );
  }
}
