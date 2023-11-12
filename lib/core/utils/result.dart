import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/core/utils/result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(Exception exception) = Failure<T>;
}
