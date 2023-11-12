import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_application/domain/entity/task.dart';
part '../../_generated/domain/entity/project.freezed.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String name,
    String? description,
    required List<Task>? tasks,
    DateTime? deadline,
  }) = _Project;
}
