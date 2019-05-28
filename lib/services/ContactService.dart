import "package:http/http.dart" as http;
import "dart:convert";

import "../models/Contact.dart";

class ConactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";
  static Future browse() async {
    http.Response response = await http.get(_url);
    String contacts = response.body;
    List collection = json.decode(contacts);
    List<Contact> _contacts =
        collection.map((m) => Contact.fromJson(m)).toList();
    return _contacts;
  }
}
