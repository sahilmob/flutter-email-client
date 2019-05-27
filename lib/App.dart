import "package:flutter/material.dart";

import "./AppDrawer.dart";
import "./MessageList.dart";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            MessageList(status: "foucesd"),
            MessageList(status: "other"),
          ],
        ),
      ),
      length: 2,
    );
  }
}
