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

  static Future<List<Message>> browse({String status = "foucesd"}) async {
    String url = status == "foucesd"
        ? "http://www.mocky.io/v2/5cec41933300004b006d7a23"
        : "http://www.mocky.io/v2/5ceaa7c23300004c2a7c387e";
    http.Response res = await http.get(url);

    await Future.delayed(Duration(seconds: 1));
    String content = res.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((m) => Message.fromJson(m)).toList();
    return _messages;
  }
}
