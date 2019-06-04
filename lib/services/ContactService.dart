import "package:http/http.dart" as http;
import "dart:convert";

import "../models/Contact.dart";

class ConactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get(_url);
    String contacts = response.body;
    List collection = json.decode(contacts);
    Iterable<Contact> _contacts = collection.map((m) => Contact.fromJson(m));
    if (query != null && query.isNotEmpty) {
      _contacts = _contacts
          .where((contact) => contact.name.toLowerCase().contains(query));
    }
    return _contacts.toList();
  }
}
