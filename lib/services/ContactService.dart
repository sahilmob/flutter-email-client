import "package:http/http.dart" as http;
import "dart:convert";

import "../models/Contact.dart";

class ConactService {
  static String _url =
      "https://flutter-email-client-backend.herokuapp.com/contacts";

  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get("$_url?q=$query");
    String contacts = response.body;
    List collection = json.decode(contacts);
    Iterable<Contact> _contacts = collection.map((m) => Contact.fromJson(m));

    return _contacts.toList();
  }
}
