// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reminderPage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReminderPageModel {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;

  @HiveField(1)
  String get dosis => throw _privateConstructorUsedError;

  @HiveField(2)
  String get frequency => throw _privateConstructorUsedError;

  @HiveField(3)
  String get importance => throw _privateConstructorUsedError;

  @HiveField(4)
  String get details => throw _privateConstructorUsedError;

  @HiveField(5)
  TimeOfDay get timeOfDay => throw _privateConstructorUsedError;

  @HiveField(6)
  bool get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderPageModelCopyWith<ReminderPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderPageModelCopyWith<$Res> {
  factory $ReminderPageModelCopyWith(
          ReminderPageModel value, $Res Function(ReminderPageModel) then) =
      _$ReminderPageModelCopyWithImpl<$Res>;

  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String dosis,
      @HiveField(2) String frequency,
      @HiveField(3) String importance,
      @HiveField(4) String details,
      @HiveField(5) TimeOfDay timeOfDay,
      @HiveField(6) bool status});
}

/// @nodoc
class _$ReminderPageModelCopyWithImpl<$Res>
    implements $ReminderPageModelCopyWith<$Res> {
  _$ReminderPageModelCopyWithImpl(this._value, this._then);

  final ReminderPageModel _value;
  // ignore: unused_field
  final $Res Function(ReminderPageModel) _then;

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
abstract class _$$_ReminderPageModelCopyWith<$Res>
    implements $ReminderPageModelCopyWith<$Res> {
  factory _$$_ReminderPageModelCopyWith(_$_ReminderPageModel value,
          $Res Function(_$_ReminderPageModel) then) =
      __$$_ReminderPageModelCopyWithImpl<$Res>;

  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String dosis,
      @HiveField(2) String frequency,
      @HiveField(3) String importance,
      @HiveField(4) String details,
      @HiveField(5) TimeOfDay timeOfDay,
      @HiveField(6) bool status});
}

/// @nodoc
class __$$_ReminderPageModelCopyWithImpl<$Res>
    extends _$ReminderPageModelCopyWithImpl<$Res>
    implements _$$_ReminderPageModelCopyWith<$Res> {
  __$$_ReminderPageModelCopyWithImpl(
      _$_ReminderPageModel _value, $Res Function(_$_ReminderPageModel) _then)
      : super(_value, (v) => _then(v as _$_ReminderPageModel));

  @override
  _$_ReminderPageModel get _value => super._value as _$_ReminderPageModel;

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
    return _then(_$_ReminderPageModel(
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

@HiveType(typeId: 1, adapterName: 'ReminderPageModelAdapter')
class _$_ReminderPageModel implements _ReminderPageModel {
  const _$_ReminderPageModel(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.dosis,
      @HiveField(2) required this.frequency,
      @HiveField(3) required this.importance,
      @HiveField(4) required this.details,
      @HiveField(5) required this.timeOfDay,
      @HiveField(6) required this.status});

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String dosis;
  @override
  @HiveField(2)
  final String frequency;
  @override
  @HiveField(3)
  final String importance;
  @override
  @HiveField(4)
  final String details;
  @override
  @HiveField(5)
  final TimeOfDay timeOfDay;
  @override
  @HiveField(6)
  final bool status;

  @override
  String toString() {
    return 'ReminderPageModel(name: $name, dosis: $dosis, frequency: $frequency, importance: $importance, details: $details, timeOfDay: $timeOfDay, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReminderPageModel &&
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
  _$$_ReminderPageModelCopyWith<_$_ReminderPageModel> get copyWith =>
      __$$_ReminderPageModelCopyWithImpl<_$_ReminderPageModel>(
          this, _$identity);
}

abstract class _ReminderPageModel implements ReminderPageModel {
  const factory _ReminderPageModel(
      {@HiveField(0) required final String name,
      @HiveField(1) required final String dosis,
      @HiveField(2) required final String frequency,
      @HiveField(3) required final String importance,
      @HiveField(4) required final String details,
      @HiveField(5) required final TimeOfDay timeOfDay,
      @HiveField(6) required final bool status}) = _$_ReminderPageModel;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;

  @override
  @HiveField(1)
  String get dosis => throw _privateConstructorUsedError;

  @override
  @HiveField(2)
  String get frequency => throw _privateConstructorUsedError;

  @override
  @HiveField(3)
  String get importance => throw _privateConstructorUsedError;

  @override
  @HiveField(4)
  String get details => throw _privateConstructorUsedError;

  @override
  @HiveField(5)
  TimeOfDay get timeOfDay => throw _privateConstructorUsedError;

  @override
  @HiveField(6)
  bool get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReminderPageModelCopyWith<_$_ReminderPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
