import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:tabmind/pages/calendar/calendar_controller.dart';
import 'package:tabmind/pages/calendar/calendar_model.dart';
import 'package:tabmind/pages/calendar/calendar_view.dart';
import 'package:tabmind/pages/creationPage/creationPage_controller.dart';
import 'package:tabmind/pages/creationPage/creationPage_model.dart';
import 'package:tabmind/pages/creationPage/creationPage_view.dart';

import '../local_persistence/hive_service_implementation.dart';
import '../pages/home/home_controller.dart';
import '../pages/home/home_model.dart';
import '../pages/home/home_view.dart';
import '../pages/profiles/profiles_controller.dart';
import '../pages/profiles/profiles_model.dart';
import '../pages/profiles/profiles_view.dart';
import '../pages/reminderPage/reminderPage_controller.dart';
import '../pages/reminderPage/reminderPage_model.dart';
import '../pages/reminderPage/reminderPage_view.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplementation());

  final StateNotifierProvider<CreationPageController, CreationPageModel>
      creationPageControllerProvider = StateNotifierProvider<CreationPageController, CreationPageModel>(
          (StateNotifierProviderRef ref) => CreationPageControllerImplementation(id: '0'));

  final StateNotifierProvider<ReminderPageController, ReminderPageModel>
      reminderPageControllerProvider = StateNotifierProvider<ReminderPageController, ReminderPageModel>(
          (StateNotifierProviderRef ref) => ReminderPageControllerImplementation());

  final StateNotifierProvider<CalendarController, CalendarModel>
  calendarControllerProvider = StateNotifierProvider<CalendarController, CalendarModel>(
          (StateNotifierProviderRef ref) => CalendarControllerImplementation());

  final StateNotifierProviderFamily<CreationPageController, CreationPageModel,
          String> creationPageControllerProviderFamily =
      StateNotifierProvider.family<CreationPageController, CreationPageModel,
              String>(
          (StateNotifierProviderRef ref, String id) =>
              CreationPageControllerImplementation(
                id: id,
              ));

  final Provider<HiveServiceImplementation> localPersistenceProvider =
      Provider<HiveServiceImplementation>(
          (ProviderRef ref) => HiveServiceImplementation());

  final StateNotifierProvider<ProfilesController,
          Box<ProfilesModel>> //Box<ProfileModel> ...
      profilesControllerProvider =
      StateNotifierProvider<ProfilesController, Box<ProfilesModel>>(
          (StateNotifierProviderRef ref) => ProfilesControllerImplementation(
              localPersistenceService:
                  ref.watch(providers.localPersistenceProvider)));
}
