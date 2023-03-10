// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'creationPage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreationPageModel {
  String get name => throw _privateConstructorUsedError;
  String get dosis => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  String get importance => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  TimeOfDay get timeOfDay => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreationPageModelCopyWith<CreationPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreationPageModelCopyWith<$Res> {
  factory $CreationPageModelCopyWith(
          CreationPageModel value, $Res Function(CreationPageModel) then) =
      _$CreationPageModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String dosis,
      String frequency,
      String importance,
      String details,
      TimeOfDay timeOfDay,
      bool status});
}

/// @nodoc
class _$CreationPageModelCopyWithImpl<$Res>
    implements $CreationPageModelCopyWith<$Res> {
  _$CreationPageModelCopyWithImpl(this._value, this._then);

  final CreationPageModel _value;
  // ignore: unused_field
  final $Res Function(CreationPageModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? dosis = freezed,
    Object? frequency = freezed,
    Object? importance = freezed,
    Object? details = freezed,
    Object? timeOfDay = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosis: dosis == freezed
          ? _value.dosis
          : dosis // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      timeOfDay: timeOfDay == freezed
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CreationPageModelCopyWith<$Res>
    implements $CreationPageModelCopyWith<$Res> {
  factory _$$_CreationPageModelCopyWith(_$_CreationPageModel value,
          $Res Function(_$_CreationPageModel) then) =
      __$$_CreationPageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String dosis,
      String frequency,
      String importance,
      String details,
      TimeOfDay timeOfDay,
      bool status});
}

/// @nodoc
class __$$_CreationPageModelCopyWithImpl<$Res>
    extends _$CreationPageModelCopyWithImpl<$Res>
    implements _$$_CreationPageModelCopyWith<$Res> {
  __$$_CreationPageModelCopyWithImpl(
      _$_CreationPageModel _value, $Res Function(_$_CreationPageModel) _then)
      : super(_value, (v) => _then(v as _$_CreationPageModel));

  @override
  _$_CreationPageModel get _value => super._value as _$_CreationPageModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? dosis = freezed,
    Object? frequency = freezed,
    Object? importance = freezed,
    Object? details = freezed,
    Object? timeOfDay = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_CreationPageModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosis: dosis == freezed
          ? _value.dosis
          : dosis // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      timeOfDay: timeOfDay == freezed
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreationPageModel implements _CreationPageModel {
  const _$_CreationPageModel(
      {required this.name,
      required this.dosis,
      required this.frequency,
      required this.importance,
      required this.details,
      required this.timeOfDay,
      required this.status});

  @override
  final String name;
  @override
  final String dosis;
  @override
  final String frequency;
  @override
  final String importance;
  @override
  final String details;
  @override
  final TimeOfDay timeOfDay;
  @override
  final bool status;

  @override
  String toString() {
    return 'CreationPageModel(name: $name, dosis: $dosis, frequency: $frequency, importance: $importance, details: $details, timeOfDay: $timeOfDay, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreationPageModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.dosis, dosis) &&
            const DeepCollectionEquality().equals(other.frequency, frequency) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality().equals(other.timeOfDay, timeOfDay) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(dosis),
      const DeepCollectionEquality().hash(frequency),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(timeOfDay),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_CreationPageModelCopyWith<_$_CreationPageModel> get copyWith =>
      __$$_CreationPageModelCopyWithImpl<_$_CreationPageModel>(
          this, _$identity);
}

abstract class _CreationPageModel implements CreationPageModel {
  const factory _CreationPageModel(
      {required final String name,
      required final String dosis,
      required final String frequency,
      required final String importance,
      required final String details,
      required final TimeOfDay timeOfDay,
      required final bool status}) = _$_CreationPageModel;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get dosis => throw _privateConstructorUsedError;
  @override
  String get frequency => throw _privateConstructorUsedError;
  @override
  String get importance => throw _privateConstructorUsedError;
  @override
  String get details => throw _privateConstructorUsedError;
  @override
  TimeOfDay get timeOfDay => throw _privateConstructorUsedError;
  @override
  bool get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreationPageModelCopyWith<_$_CreationPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
