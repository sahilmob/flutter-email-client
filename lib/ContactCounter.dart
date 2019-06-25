import './manager/ContactManager.dart';
import 'package:emailapp/Observer.dart';
import "package:flutter/material.dart";
import "./Provider.dart";

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);
    return Observer<int>(
      stream: manager.count$,
      onSuccess: (context, data) => Chip(
            backgroundColor: Colors.red,
            label: Text(
              (data ?? 0).toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
    );
  }
}
