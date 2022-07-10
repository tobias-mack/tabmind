import 'package:flutter/material.dart';
import 'package:flutter/src/material/time.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';
import 'package:tabmind/pages/profiles/profiles_view.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_model.dart';
import 'package:tabmind/ui-kit/reminder_home_tile.dart';

class ProfilesControllerImplementation extends ProfilesController {
  ProfilesControllerImplementation({List<ProfilesModel>? model})
      : super(
          model ?? List<ProfilesModel>.empty(),
        );

  @override
  void addProfile(String name) {
    ProfilesModel profile =
        ProfilesModel(reminders: [], profileName: name, active: false);
    state = [...state, profile];
  }

  @override
  void removeProfile(String name) {
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
    List<ReminderHomeTile> reminderUpcomingHomeTile = [];

    for (ProfilesModel profile in state) {
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
    return state
        .firstWhere((element) => element.profileName == profileName)
        .reminders
        .firstWhere((element) => element.name == name);
  }

  @override
  void removeReminder(String profileName, String name) {
    List<ProfilesModel> newList = [];
    List<ReminderPageModel> newReminderList = [];

    for (ProfilesModel profile in state) {
      if (profile.profileName == profileName) {
        for (ReminderPageModel r in profile.reminders) {
          if (r.name != name) {
            newReminderList.add(r);
          }
        }
        profile = profile.copyWith(reminders: newReminderList);
        newList.add(profile);
      } else {
        newList.add(profile);
      }
    }
    state = newList;
  }
}
