import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';
part '../../../_generated/provider/state/navigation/navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    required AuthRoutePath authRoutePath,
    required MainAppRoutePath mainAppRoutePath,
    required bool isSessionTimeout,
  }) = _NavigationState;
}
