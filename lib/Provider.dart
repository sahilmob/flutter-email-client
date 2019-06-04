import "package:flutter/material.dart";

import 'ContactManager.dart';

class Provider extends InheritedWidget {
  final ContactManager data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static ContactManager of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
