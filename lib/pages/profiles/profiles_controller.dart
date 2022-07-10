import 'package:flutter/material.dart';
import 'package:flutter/src/material/time.dart';
import 'package:hive/hive.dart';
import 'package:tabmind/local_persistence/hive_service_implementation.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';
import 'package:tabmind/pages/profiles/profiles_view.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_model.dart';
import 'package:tabmind/ui-kit/reminder_home_tile.dart';

class ProfilesControllerImplementation extends ProfilesController {
  final HiveServiceImplementation _localPersistenceService;

  ProfilesControllerImplementation(
      {required HiveServiceImplementation localPersistenceService,
      List<ProfilesModel>? model})
      : _localPersistenceService = localPersistenceService,
        super(
          model ?? List<ProfilesModel>.empty(),
        );

  @override
  void addProfile(String name) {
    ProfilesModel profile = _localPersistenceService.addProfile(name);
    //ProfilesModel profile =
    //    ProfilesModel(reminders: [], profileName: name, active: false);
    state = [...state, profile];
  }

  @override
  void removeProfile(String name) {
    _localPersistenceService.removeProfile(name);
    state = [
      for (final profile in state)
        if (profile.profileName != name) profile,
    ];
  }

  @override
  void changeName(String name, String newName) {
    List<ProfilesModel> newList = [];

    for (ProfilesModel profile in state) {
      if (profile.profileName == name) {
        profile = profile.copyWith(profileName: newName);
        newList.add(profile);
      } else {
        newList.add(profile);
      }
    }

    state = newList;
  }

  @override
  List<ReminderHomeTile> upcomingReminders() {
    // TODO: implement upcomingReminders
    return [];
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
    ReminderPageModel newReminder = ReminderPageModel(
        name: name,
        dosis: dosis,
        frequency: frequency,
        importance: importance,
        details: details,
        timeOfDay: timeOfDay,
        status: false);

    List<ProfilesModel> newList = [];
    List<ReminderPageModel> newReminderList = [];
    newReminderList.add(newReminder);

    for (ProfilesModel profile in state) {
      if (profile.profileName == profileName) {
        for (ReminderPageModel r in profile.reminders) {
          newReminderList.add(r);
        }
        profile = profile.copyWith(reminders: newReminderList);
        newList.add(profile);
      } else {
        newList.add(profile);
      }
    }
    state = newList;
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
    // TODO: implement changeReminder
  }

  @override
  ReminderPageModel getReminder(String profileName, String name) {
    // TODO: implement getReminder
    return ReminderPageModel(
        name: "name",
        dosis: "dosis",
        frequency: "frequency",
        importance: "importance",
        details: "details",
        timeOfDay: TimeOfDay.now(),
        status: false);
  }

  @override
  void initProfiles(Box<ProfilesModel> profiles) {
    state = profiles.values.toList().cast<ProfilesModel>();
  }
}
