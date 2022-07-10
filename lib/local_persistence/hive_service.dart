import 'package:flutter/material.dart';

import '../pages/profiles/profiles_model.dart';
import '../pages/reminderPage/reminderPage_model.dart';
import '../ui-kit/reminder_home_tile.dart';

abstract class HiveService {
  ProfilesModel addProfile(String name);

  void removeProfile(String name);

  void changeName(String name, String newName);

  List<ReminderHomeTile> upcomingReminders();

  List<ReminderHomeTile> remindersToday();

  void addReminder(String profileName, String name, String dosis,
      String frequency, String details, String importance, TimeOfDay timeOfDay);

  ReminderPageModel getReminder(String profileName, String name);

  void changeReminder(String profileName, String name, String dosis,
      String frequency, String details, String importance, TimeOfDay timeOfDay);

  void clearAll();
}
