// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../provider/state/navigation/navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  AuthRoutePath get authRoutePath => throw _privateConstructorUsedError;
  MainAppRoutePath get mainAppRoutePath => throw _privateConstructorUsedError;
  bool get isSessionTimeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call(
      {AuthRoutePath authRoutePath,
      MainAppRoutePath mainAppRoutePath,
      bool isSessionTimeout});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authRoutePath = null,
    Object? mainAppRoutePath = null,
    Object? isSessionTimeout = null,
  }) {
    return _then(_value.copyWith(
      authRoutePath: null == authRoutePath
          ? _value.authRoutePath
          : authRoutePath // ignore: cast_nullable_to_non_nullable
              as AuthRoutePath,
      mainAppRoutePath: null == mainAppRoutePath
          ? _value.mainAppRoutePath
          : mainAppRoutePath // ignore: cast_nullable_to_non_nullable
              as MainAppRoutePath,
      isSessionTimeout: null == isSessionTimeout
          ? _value.isSessionTimeout
          : isSessionTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationStateImplCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$NavigationStateImplCopyWith(_$NavigationStateImpl value,
          $Res Function(_$NavigationStateImpl) then) =
      __$$NavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthRoutePath authRoutePath,
      MainAppRoutePath mainAppRoutePath,
      bool isSessionTimeout});
}

/// @nodoc
class __$$NavigationStateImplCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$NavigationStateImpl>
    implements _$$NavigationStateImplCopyWith<$Res> {
  __$$NavigationStateImplCopyWithImpl(
      _$NavigationStateImpl _value, $Res Function(_$NavigationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authRoutePath = null,
    Object? mainAppRoutePath = null,
    Object? isSessionTimeout = null,
  }) {
    return _then(_$NavigationStateImpl(
      authRoutePath: null == authRoutePath
          ? _value.authRoutePath
          : authRoutePath // ignore: cast_nullable_to_non_nullable
              as AuthRoutePath,
      mainAppRoutePath: null == mainAppRoutePath
          ? _value.mainAppRoutePath
          : mainAppRoutePath // ignore: cast_nullable_to_non_nullable
              as MainAppRoutePath,
      isSessionTimeout: null == isSessionTimeout
          ? _value.isSessionTimeout
          : isSessionTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl
    with DiagnosticableTreeMixin
    implements _NavigationState {
  const _$NavigationStateImpl(
      {required this.authRoutePath,
      required this.mainAppRoutePath,
      required this.isSessionTimeout});

  @override
  final AuthRoutePath authRoutePath;
  @override
  final MainAppRoutePath mainAppRoutePath;
  @override
  final bool isSessionTimeout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationState(authRoutePath: $authRoutePath, mainAppRoutePath: $mainAppRoutePath, isSessionTimeout: $isSessionTimeout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationState'))
      ..add(DiagnosticsProperty('authRoutePath', authRoutePath))
      ..add(DiagnosticsProperty('mainAppRoutePath', mainAppRoutePath))
      ..add(DiagnosticsProperty('isSessionTimeout', isSessionTimeout));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationStateImpl &&
            (identical(other.authRoutePath, authRoutePath) ||
                other.authRoutePath == authRoutePath) &&
            (identical(other.mainAppRoutePath, mainAppRoutePath) ||
                other.mainAppRoutePath == mainAppRoutePath) &&
            (identical(other.isSessionTimeout, isSessionTimeout) ||
                other.isSessionTimeout == isSessionTimeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, authRoutePath, mainAppRoutePath, isSessionTimeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      __$$NavigationStateImplCopyWithImpl<_$NavigationStateImpl>(
          this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {required final AuthRoutePath authRoutePath,
      required final MainAppRoutePath mainAppRoutePath,
      required final bool isSessionTimeout}) = _$NavigationStateImpl;

  @override
  AuthRoutePath get authRoutePath;
  @override
  MainAppRoutePath get mainAppRoutePath;
  @override
  bool get isSessionTimeout;
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
