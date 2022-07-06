
import 'package:flutter/material.dart';

import 'creationPage_model.dart';
import 'creationPage_view.dart';
import '../../pages/reminderPage/reminderPage_model.dart';

class CreationPageControllerImplementation extends CreationPageController {
  var list = <ReminderPageModel>[];

  CreationPageControllerImplementation({required String id,CreationPageModel? model})
      : super(
    model ?? const CreationPageModel(name: 'Test Reminder', dosis: 'one', frequency: 'often', details: 'none', importance: 'not impo', timeOfDay: TimeOfDay(hour: 1, minute: 55), status: false),
  );

  @override
  void addReminder(String name, String dosis, String frequency, String details, String importance, TimeOfDay timeOfDay, bool status) {
    var reminder = ReminderPageModel(name: name, dosis: dosis, frequency: frequency, importance: importance, details: details, timeOfDay: timeOfDay, status: status);
    list.add(reminder);
  }

  @override
  String showReminder() {
    return list[0].toString();
  }

}