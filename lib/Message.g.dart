// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      subject: json['subject'] as String, body: json['body'] as String);
}

Map<String, dynamic> _$MessageToJson(Message instance) =>
    <String, dynamic>{'subject': instance.subject, 'body': instance.body};
