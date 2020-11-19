// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$_$_TodoFromJson(Map<String, dynamic> json) {
  return _$_Todo(
    id: json['id'] as int,
    title: json['title'] as String,
    done: json['done'] as bool ?? false,
    ts: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$_$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
      'timestamp': instance.ts?.toIso8601String(),
    };
