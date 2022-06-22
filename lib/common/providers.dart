import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/calendar/calendar_controller.dart';
import 'package:tabmind/pages/calendar/calendar_model.dart';
import 'package:tabmind/pages/calendar/calendar_view.dart';

import 'package:tabmind/pages/creationPage/creationPage_model.dart';
import 'package:tabmind/pages/creationPage/creationPage_view.dart';
import 'package:tabmind/pages/creationPage/creationPage_controller.dart';


import '../pages/reminderPage/reminderPage_model.dart';
import '../pages/reminderPage/reminderPage_view.dart';
import '../pages/reminderPage/reminderPage_controller.dart';

import '../pages/home/home_controller.dart';
import '../pages/home/home_model.dart';
import '../pages/home/home_view.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplementation());

  final StateNotifierProvider<CreationPageController, CreationPageModel>
      creationPageControllerProvider = StateNotifierProvider<CreationPageController, CreationPageModel>(
          (StateNotifierProviderRef ref) => CreationPageControllerImplementation());

  final StateNotifierProvider<ReminderPageController, ReminderPageModel>
      reminderPageControllerProvider = StateNotifierProvider<ReminderPageController, ReminderPageModel>(
          (StateNotifierProviderRef ref) => ReminderPageControllerImplementation());

  final StateNotifierProvider<CalendarController, CalendarModel>
  calendarControllerProvider = StateNotifierProvider<CalendarController, CalendarModel>(
          (StateNotifierProviderRef ref) => CalendarControllerImplementation());


}
