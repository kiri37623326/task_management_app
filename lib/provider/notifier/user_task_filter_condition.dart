import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/provider/notifier/user_task_filter_condition.freezed.dart';

@freezed
class UserTaskFilterCondition with _$UserTaskFilterCondition {
  const factory UserTaskFilterCondition({
    required String title,
  }) = _UserTaskFilterCondition;
}
