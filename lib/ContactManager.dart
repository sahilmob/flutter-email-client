import 'dart:async';
import "package:rxdart/rxdart.dart";

import "./services/ContactService.dart";
import './models/Contact.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListNow {
    return Stream.fromFuture(
      ConactService.browse(),
    );
  }

  Stream<List<Contact>> filteredCollection({query}) => Stream.fromFuture(
        ConactService.browse(query: query),
      );

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}
