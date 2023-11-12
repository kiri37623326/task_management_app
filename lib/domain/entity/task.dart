import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/domain/entity/task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String name,
    String? description,
    List<Task>? children,
  }) = _Task;
}
