import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains("@");

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("isemail");
      sink.add(value);
    } else {
      sink.addError("Our message error");
    }
  });
}
