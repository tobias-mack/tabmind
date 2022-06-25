// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'reminderDetails_model.freezed.dart';

@freezed
class ReminderDetailsModel with _$ReminderDetailsModel {
  const factory ReminderDetailsModel() = _ReminderDetailsModel;
}