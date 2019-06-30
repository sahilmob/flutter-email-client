import 'dart:async';

import 'package:emailapp/manager/validation.dart';
import 'package:rxdart/subjects.dart';

class MessageFormManager with Validation {
  final _email = BehaviorSubject<String>.seeded("@");

  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;
}
