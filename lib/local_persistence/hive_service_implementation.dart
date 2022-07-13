import 'package:flutter/src/material/time.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabmind/local_persistence/hive_service.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_model.dart';
import 'package:tabmind/ui-kit/reminder_home_tile.dart';

import 'Boxes.dart';

class HiveServiceImplementation implements HiveService {
  //late final Box<ProfilesModel> profiles;
  static const String boxName = 'profiles';

  HiveServiceImplementation();

  initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProfileModelAdapter());
    await Hive.openBox<ProfilesModel>(boxName);
  }

  //@override
  //List<AlbumModel> getAllAlbums() => _albums.values.toList();

  @override
  void clearAll() {
    Boxes.getProfiles().clear();
  }

  @override
  ProfilesModel addProfile(String name) {
    ProfilesModel profile =
        ProfilesModel(reminders: [], profileName: name, active: false);
    Boxes.getProfiles().add(profile);
    return profile;
  }

  @override
  void removeProfile(String name) {
    final Map<dynamic, ProfilesModel> deliveriesMap =
        Boxes.getProfiles().toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.profileName == name) {
        desiredKey = key;
      }
    });
    Boxes.getProfiles().delete(desiredKey);
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
    // TODO: implement addReminder mit Tim
  }

  @override
  void changeName(String name, String newName) {
    // TODO: implement changeName
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
    throw UnimplementedError();
  }

  @override
  List<ReminderHomeTile> remindersToday() {
    // TODO: implement remindersToday
    throw UnimplementedError();
  }

  @override
  List<ReminderHomeTile> upcomingReminders() {
    // TODO: implement upcomingReminders
    throw UnimplementedError();
  }
}
