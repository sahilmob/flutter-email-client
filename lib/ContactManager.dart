import 'dart:async';

import "./services/ContactService.dart";
import './models/Contact.dart';

class ContactManager {
  final StreamController<int> _contactCounter = StreamController<int>();
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
