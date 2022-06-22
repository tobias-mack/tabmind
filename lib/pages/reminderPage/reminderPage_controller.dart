
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reminderPage_model.dart';
import 'reminderPage_view.dart';

class ReminderPageControllerImplementation extends ReminderPageController {
  ReminderPageControllerImplementation({ReminderPageModel? model})
      : super(
    model ??  const ReminderPageModel(name: 'Test Reminder', dosis: 'one', frequency: 'often', details: 'none', importance: 'not impo', timeOfDay: TimeOfDay(hour: 1, minute: 55)),
  );

  @override
  void addReminder() {
    }

}