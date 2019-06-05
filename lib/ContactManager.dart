import 'dart:async';
import "package:rxdart/rxdart.dart";

import "./services/ContactService.dart";
import './models/Contact.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
  Stream<int> get count$ => _contactCounter.stream;

  Stream<List<Contact>> browse$({query}) => Stream.fromFuture(
        ConactService.browse(query: query),
      );

  ContactManager() {
    browse$().listen((list) => _contactCounter.add(list.length));
  }

  void dispose() {
    _contactCounter.close();
  }
}
