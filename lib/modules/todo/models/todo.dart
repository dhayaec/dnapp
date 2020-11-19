import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  @Assert('title.isNotEmpty', 'title can not be empty')
  factory Todo({
    @required int id,
    @required String title,
    @Default(false) bool done,
    @JsonKey(name: 'timestamp') DateTime ts,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  @late
  DateTime get timestamp => ts ?? DateTime.now();
}
