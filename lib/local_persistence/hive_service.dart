import 'package:flutter/material.dart';

import '../pages/profiles/profiles_model.dart';
import '../pages/reminderPage/reminderPage_model.dart';

abstract class HiveService {
  ProfilesModel addProfile(String name);

  void removeProfile(String name);

  void changeName(String name, String newName);

  void addReminder(String profileName, String name, String dosis,
      String frequency, String details, String importance, TimeOfDay timeOfDay);

  ReminderPageModel getReminder(String profileName, String name);

  void toggleReminder(String profileName, String name);

  void toggleProfile(String profileName);

  void changeReminder(
      String profileName,
      String name,
      String oldName,
      String dosis,
      String frequency,
      String details,
      String importance,
      TimeOfDay timeOfDay);

  void removeReminder(String profileName, String name);

  void clearAll();
}
