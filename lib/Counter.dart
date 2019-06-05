import 'package:emailapp/CounterManager.dart';
import 'package:emailapp/Observer.dart';
import 'package:emailapp/Provider.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return Center(
      child: Observer<int>(
        stream: manager.counter$,
        onSuccess: (context, data) {
          return Text("Calender: $data");
        },
      ),
    );
  }
}
