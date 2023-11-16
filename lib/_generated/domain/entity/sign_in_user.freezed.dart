// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entity/sign_in_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInUser {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Session get session => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInUserCopyWith<SignInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInUserCopyWith<$Res> {
  factory $SignInUserCopyWith(
          SignInUser value, $Res Function(SignInUser) then) =
      _$SignInUserCopyWithImpl<$Res, SignInUser>;
  @useResult
  $Res call({String id, String displayName, String email, Session session});
}

/// @nodoc
class _$SignInUserCopyWithImpl<$Res, $Val extends SignInUser>
    implements $SignInUserCopyWith<$Res> {
  _$SignInUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
    Object? session = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInUserImplCopyWith<$Res>
    implements $SignInUserCopyWith<$Res> {
  factory _$$SignInUserImplCopyWith(
          _$SignInUserImpl value, $Res Function(_$SignInUserImpl) then) =
      __$$SignInUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String displayName, String email, Session session});
}

/// @nodoc
class __$$SignInUserImplCopyWithImpl<$Res>
    extends _$SignInUserCopyWithImpl<$Res, _$SignInUserImpl>
    implements _$$SignInUserImplCopyWith<$Res> {
  __$$SignInUserImplCopyWithImpl(
      _$SignInUserImpl _value, $Res Function(_$SignInUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
    Object? session = null,
  }) {
    return _then(_$SignInUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ));
  }
}

/// @nodoc

class _$SignInUserImpl with DiagnosticableTreeMixin implements _SignInUser {
  const _$SignInUserImpl(
      {required this.id,
      required this.displayName,
      required this.email,
      required this.session});

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final Session session;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInUser(id: $id, displayName: $displayName, email: $email, session: $session)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('session', session));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, email, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInUserImplCopyWith<_$SignInUserImpl> get copyWith =>
      __$$SignInUserImplCopyWithImpl<_$SignInUserImpl>(this, _$identity);
}

abstract class _SignInUser implements SignInUser {
  const factory _SignInUser(
      {required final String id,
      required final String displayName,
      required final String email,
      required final Session session}) = _$SignInUserImpl;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get email;
  @override
  Session get session;
  @override
  @JsonKey(ignore: true)
  _$$SignInUserImplCopyWith<_$SignInUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
