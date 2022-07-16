import 'package:flutter/src/material/time.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabmind/local_persistence/hive_service.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_model.dart';

import 'Boxes.dart';

class HiveServiceImplementation implements HiveService {
  //late final Box<ProfilesModel> profiles;
  static const String boxName = 'profiles';

  HiveServiceImplementation();

  initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProfileModelAdapter());
    Hive.registerAdapter(ReminderPageModelAdapter());
    Hive.registerAdapter(TimeOfDayAdapter());
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
    var desiredKey = getProfileKey(name);
    Boxes.getProfiles().delete(desiredKey);
  }

  getProfileKey(String name) {
    final Map<dynamic, ProfilesModel> profilesMap = Boxes.getProfiles().toMap();
    dynamic desiredKey;
    profilesMap.forEach((key, value) {
      if (value.profileName == name) {
        desiredKey = key;
      }
    });
    return desiredKey;
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
    var desiredKey = getProfileKey(profileName);
    ProfilesModel? profile = Boxes.getProfiles().get(desiredKey);
    ReminderPageModel newReminder = ReminderPageModel(
        name: name,
        dosis: dosis,
        frequency: frequency,
        importance: importance,
        details: details,
        timeOfDay: timeOfDay,
        status: false);

    List<ReminderPageModel> newList = [];
    newList.add(newReminder);
    for (var element in profile!.reminders) {
      newList.add(element);
    }
    ProfilesModel newProfile = profile.copyWith(reminders: newList);
    Boxes.getProfiles().put(desiredKey, newProfile);
  }

  @override
  void changeName(String name, String newName) {
    var desiredKey = getProfileKey(name);
    ProfilesModel? profile = Boxes.getProfiles().get(desiredKey);
    ProfilesModel? newProfile = profile?.copyWith(profileName: newName);
    Boxes.getProfiles().put(desiredKey, newProfile!);
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
    var desiredKey = getProfileKey(profileName);
    ProfilesModel? profile = Boxes.getProfiles().get(desiredKey);

    List<ReminderPageModel> newList = [];

    for (var element in profile!.reminders) {
      if (element.name != name) {
        newList.add(element);
      }
    }
    ReminderPageModel newReminder = ReminderPageModel(
        name: name,
        dosis: dosis,
        frequency: frequency,
        importance: importance,
        details: details,
        timeOfDay: timeOfDay,
        status: false);
    newList.add(newReminder);

    ProfilesModel newProfile = profile.copyWith(reminders: newList);
    Boxes.getProfiles().put(desiredKey, newProfile);
  }

  @override
  ReminderPageModel getReminder(String profileName, String name) {
    var desiredKey = getProfileKey(profileName);
    ProfilesModel? profile = Boxes.getProfiles().get(desiredKey);
    ReminderPageModel reminder =
        profile!.reminders.firstWhere((element) => element.name == name);
    return reminder;
  }

  @override
  void removeReminder(String profileName, String name) {
    var desiredKey = getProfileKey(profileName);
    ProfilesModel? profile = Boxes.getProfiles().get(desiredKey);
    List<ReminderPageModel> newList = [];

    for (var element in profile!.reminders) {
      if (element.name != name) {
        newList.add(element);
      }
    }

    ProfilesModel newProfile = profile.copyWith(reminders: newList);
    Boxes.getProfiles().put(desiredKey, newProfile);
  }
}
