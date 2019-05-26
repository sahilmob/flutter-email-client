import 'package:json_annotation/json_annotation.dart';
import "package:http/http.dart" as http;

import "dart:convert";

part "Message.g.dart";

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message({this.subject, this.body});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    http.Response res =
        await http.get("http://www.mocky.io/v2/5ceaa7c23300004c2a7c387e");

    await Future.delayed(Duration(seconds: 3));
    String content = res.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((m) => Message.fromJson(m)).toList();
    return _messages;
  }
}
