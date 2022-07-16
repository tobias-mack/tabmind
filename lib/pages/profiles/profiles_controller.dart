import 'package:flutter/material.dart';
import 'package:flutter/src/material/time.dart';
import 'package:hive/hive.dart';
import 'package:tabmind/local_persistence/hive_service_implementation.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';
import 'package:tabmind/pages/profiles/profiles_view.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_model.dart';
import 'package:tabmind/ui-kit/reminder_home_tile.dart';

import '../../local_persistence/Boxes.dart';

class ProfilesControllerImplementation extends ProfilesController {
  final HiveServiceImplementation _localPersistenceService;

  ProfilesControllerImplementation(
      {required HiveServiceImplementation localPersistenceService,
      Box<ProfilesModel>? model})
      : _localPersistenceService = localPersistenceService,
        super(
          model ?? Boxes.getProfiles(),
        );

  @override
  void addProfile(String name) {
    _localPersistenceService.addProfile(name);
  }

  @override
  void removeProfile(String name) {
    _localPersistenceService.removeProfile(name);
  }

  @override
  void changeName(String name, String newName) {
    _localPersistenceService.changeName(name, newName);
  }

  @override
  List<ReminderHomeTile> upcomingReminders() {
    List<ReminderHomeTile> reminderUpcomingHomeTile = [];

    for (ProfilesModel profile in state.values) {
      for (ReminderPageModel r in profile.reminders) {
        reminderUpcomingHomeTile
            .add(ReminderHomeTile(profile.profileName, r.name, r.status));
      }
    }
    // TODO: implementation not working, timeOfDay not correct
    reminderUpcomingHomeTile
        .sort((a, b) => a.timeOfDay.hour.compareTo(b.timeOfDay.hour));

    return reminderUpcomingHomeTile;
  }

  @override
  List<ReminderHomeTile> remindersToday() {
    // TODO: implement remindersToday
    return [];
  }

  @override
  void addReminder(
      String profileName,
      String name,
      String dosis,
      String frequency,
      String details,
      String importance,
      TimeOfDay timeOfDay) {
    _localPersistenceService.addReminder(
        profileName, name, dosis, frequency, details, importance, timeOfDay);
  }

  @override
  void changeReminder(
      String profileName,
      String name,
      String dosis,
      String frequency,
      String details,
      String importance,
      TimeOfDay timeOfDay) {
    _localPersistenceService.changeReminder(
        profileName, name, dosis, frequency, details, importance, timeOfDay);
  }

  @override
  ReminderPageModel getReminder(String profileName, String name) {
    return _localPersistenceService.getReminder(profileName, name);
  }

  @override
  void removeReminder(String profileName, String name) {
    _localPersistenceService.removeReminder(profileName, name);
  }

  @override
  void initProfiles(Box<ProfilesModel> profiles) {
  }
}
