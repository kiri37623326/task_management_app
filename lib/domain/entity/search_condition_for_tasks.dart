import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/domain/entity/search_condition_for_tasks.freezed.dart';
part '../../_generated/domain/entity/search_condition_for_tasks.g.dart';

@freezed
class SearchConditionForTasks with _$SearchConditionForTasks {
  const factory SearchConditionForTasks({
    required String? projectId,
    required String? taskId,
    required String? taskStatus,
    required String? assigneeId,
  }) = _SearchConditionForTasks;
  factory SearchConditionForTasks.fromJson(Map<String, dynamic> json) =>
      _$SearchConditionForTasksFromJson(json);
}
