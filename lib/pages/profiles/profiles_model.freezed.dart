// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profiles_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfilesModel {
  @HiveField(0)
  String get profileName => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get active => throw _privateConstructorUsedError;
  @HiveField(2)
  List<ReminderPageModel> get reminders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfilesModelCopyWith<ProfilesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilesModelCopyWith<$Res> {
  factory $ProfilesModelCopyWith(
          ProfilesModel value, $Res Function(ProfilesModel) then) =
      _$ProfilesModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String profileName,
      @HiveField(1) bool active,
      @HiveField(2) List<ReminderPageModel> reminders});
}

/// @nodoc
class _$ProfilesModelCopyWithImpl<$Res>
    implements $ProfilesModelCopyWith<$Res> {
  _$ProfilesModelCopyWithImpl(this._value, this._then);

  final ProfilesModel _value;
  // ignore: unused_field
  final $Res Function(ProfilesModel) _then;

  @override
  $Res call({
    Object? profileName = freezed,
    Object? active = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_value.copyWith(
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<ReminderPageModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProfilesModelCopyWith<$Res>
    implements $ProfilesModelCopyWith<$Res> {
  factory _$$_ProfilesModelCopyWith(
          _$_ProfilesModel value, $Res Function(_$_ProfilesModel) then) =
      __$$_ProfilesModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String profileName,
      @HiveField(1) bool active,
      @HiveField(2) List<ReminderPageModel> reminders});
}

/// @nodoc
class __$$_ProfilesModelCopyWithImpl<$Res>
    extends _$ProfilesModelCopyWithImpl<$Res>
    implements _$$_ProfilesModelCopyWith<$Res> {
  __$$_ProfilesModelCopyWithImpl(
      _$_ProfilesModel _value, $Res Function(_$_ProfilesModel) _then)
      : super(_value, (v) => _then(v as _$_ProfilesModel));

  @override
  _$_ProfilesModel get _value => super._value as _$_ProfilesModel;

  @override
  $Res call({
    Object? profileName = freezed,
    Object? active = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_$_ProfilesModel(
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      reminders: reminders == freezed
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<ReminderPageModel>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: 'ProfileModelAdapter')
class _$_ProfilesModel implements _ProfilesModel {
  const _$_ProfilesModel(
      {@HiveField(0) required this.profileName,
      @HiveField(1) required this.active,
      @HiveField(2) required final List<ReminderPageModel> reminders})
      : _reminders = reminders;

  @override
  @HiveField(0)
  final String profileName;
  @override
  @HiveField(1)
  final bool active;
  final List<ReminderPageModel> _reminders;
  @override
  @HiveField(2)
  List<ReminderPageModel> get reminders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  String toString() {
    return 'ProfilesModel(profileName: $profileName, active: $active, reminders: $reminders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfilesModel &&
            const DeepCollectionEquality()
                .equals(other.profileName, profileName) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(profileName),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(_reminders));

  @JsonKey(ignore: true)
  @override
  _$$_ProfilesModelCopyWith<_$_ProfilesModel> get copyWith =>
      __$$_ProfilesModelCopyWithImpl<_$_ProfilesModel>(this, _$identity);
}

abstract class _ProfilesModel implements ProfilesModel {
  const factory _ProfilesModel(
          {@HiveField(0) required final String profileName,
          @HiveField(1) required final bool active,
          @HiveField(2) required final List<ReminderPageModel> reminders}) =
      _$_ProfilesModel;

  @override
  @HiveField(0)
  String get profileName => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  bool get active => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<ReminderPageModel> get reminders => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProfilesModelCopyWith<_$_ProfilesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
