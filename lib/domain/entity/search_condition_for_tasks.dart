import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/domain/entity/search_condition_for_tasks.freezed.dart';
part '../../_generated/domain/entity/search_condition_for_tasks.g.dart';

@freezed
class SearchConditionForTasks with _$SearchConditionForTasks {
  const factory SearchConditionForTasks({
    required String? id,
    required String? title,
    required String? projectId,
  }) = _SearchConditionForTasks;
  factory SearchConditionForTasks.fromJson(Map<String, dynamic> json) =>
      _$SearchConditionForTasksFromJson(json);
}
