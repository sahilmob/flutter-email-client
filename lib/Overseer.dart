import 'package:emailapp/manager/MessageFormManager.dart';

import './manager/ContactManager.dart';
import "./manager/CounterManager.dart";

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
    register(MessageFormManager, MessageFormManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
