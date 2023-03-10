import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';

import '../../common/providers.dart';
import '../../local_persistence/Boxes.dart';
import '../../ui-kit/profile_tile.dart';
import '../../ui-kit/reminder_home_tile.dart';
import '../../util/AppColors.dart';
import '../reminderPage/reminderPage_model.dart';

class ProfilesView extends ConsumerWidget {
  const ProfilesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfilesController controller =
        ref.read(providers.profilesControllerProvider.notifier);
    final Box<ProfilesModel> model =
        ref.watch(providers.profilesControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Image(
          image: AssetImage('assets/tabmind-logos/Logo-Black-removedbg.png'),
          width: 120,
          height: 50,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller
              .addProfile("profil" + Random().nextInt(1233333).toString());
        },
        tooltip: 'tooltip',
        backgroundColor: accentColor,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text("Your Profiles",
                  style: Theme.of(context).textTheme.headline6),
            ),
            ValueListenableBuilder<Box<ProfilesModel>>(
                valueListenable: Boxes.getProfiles().listenable(),
                builder: (context, box, _) {
                  final profiles = box.values.toList().cast<ProfilesModel>();
                  return Column(
                    children: [
                      for (int i = 0; i <= profiles.length - 1; i++)
                        ProfileTile(profiles[i].profileName, profiles[i].active)
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

abstract class ProfilesController extends StateNotifier<Box<ProfilesModel>> {
  ProfilesController(Box<ProfilesModel> state) : super(state);

  void addProfile(String name);

  void removeProfile(String name);

  void changeName(String name, String newName);

  List<ReminderHomeTile> upcomingReminders();

  List<ReminderHomeTile> remindersToday();

  void addReminder(String profileName, String name, String dosis,
      String frequency, String details, String importance, TimeOfDay timeOfDay);

  ReminderPageModel getReminder(String profileName, String name);

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

  void toggleReminder(String profileName, String name);

  void toggleProfile(String profileName);
}
