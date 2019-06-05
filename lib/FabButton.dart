import 'package:emailapp/CounterManager.dart';
import "package:flutter/material.dart";
import "./Provider.dart";

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        manager.increment();
      },
    );
  }
}
