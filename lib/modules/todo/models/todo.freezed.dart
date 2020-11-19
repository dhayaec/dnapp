// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
class _$TodoTearOff {
  const _$TodoTearOff();

// ignore: unused_element
  _Todo call(
      {@required int id,
      @required String title,
      bool done = false,
      @JsonKey(name: 'timestamp') DateTime ts}) {
    return _Todo(
      id: id,
      title: title,
      done: done,
      ts: ts,
    );
  }

// ignore: unused_element
  Todo fromJson(Map<String, Object> json) {
    return Todo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Todo = _$TodoTearOff();

/// @nodoc
mixin _$Todo {
  int get id;
  String get title;
  bool get done;
  @JsonKey(name: 'timestamp')
  DateTime get ts;

  Map<String, dynamic> toJson();
  $TodoCopyWith<Todo> get copyWith;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      bool done,
      @JsonKey(name: 'timestamp') DateTime ts});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object done = freezed,
    Object ts = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
      done: done == freezed ? _value.done : done as bool,
      ts: ts == freezed ? _value.ts : ts as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) then) =
      __$TodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      bool done,
      @JsonKey(name: 'timestamp') DateTime ts});
}

/// @nodoc
class __$TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(_Todo _value, $Res Function(_Todo) _then)
      : super(_value, (v) => _then(v as _Todo));

  @override
  _Todo get _value => super._value as _Todo;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object done = freezed,
    Object ts = freezed,
  }) {
    return _then(_Todo(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
      done: done == freezed ? _value.done : done as bool,
      ts: ts == freezed ? _value.ts : ts as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Todo implements _Todo {
  _$_Todo(
      {@required this.id,
      @required this.title,
      this.done = false,
      @JsonKey(name: 'timestamp') this.ts})
      : assert(id != null),
        assert(title != null),
        assert(done != null),
        assert(title.isNotEmpty, 'title can not be empty');

  factory _$_Todo.fromJson(Map<String, dynamic> json) =>
      _$_$_TodoFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @JsonKey(defaultValue: false)
  @override
  final bool done;
  @override
  @JsonKey(name: 'timestamp')
  final DateTime ts;

  bool _didtimestamp = false;
  DateTime _timestamp;

  @override
  DateTime get timestamp {
    if (_didtimestamp == false) {
      _didtimestamp = true;
      _timestamp = ts ?? DateTime.now();
    }
    return _timestamp;
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, done: $done, ts: $ts, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Todo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)) &&
            (identical(other.ts, ts) ||
                const DeepCollectionEquality().equals(other.ts, ts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(done) ^
      const DeepCollectionEquality().hash(ts);

  @override
  _$TodoCopyWith<_Todo> get copyWith =>
      __$TodoCopyWithImpl<_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TodoToJson(this);
  }
}

abstract class _Todo implements Todo {
  factory _Todo(
      {@required int id,
      @required String title,
      bool done,
      @JsonKey(name: 'timestamp') DateTime ts}) = _$_Todo;

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  bool get done;
  @override
  @JsonKey(name: 'timestamp')
  DateTime get ts;
  @override
  _$TodoCopyWith<_Todo> get copyWith;
}
