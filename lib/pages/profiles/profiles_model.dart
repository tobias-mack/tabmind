// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_model.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'profiles_model.freezed.dart';

@freezed
class ProfilesModel with _$ProfilesModel {
  const factory ProfilesModel({
    required String profileName,
    required bool active,
    required List<ReminderPageModel> reminders,
  }) = _ProfilesModel;
}