import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';

import '../../common/providers.dart';
import '../../ui-kit/profile_tile.dart';
import '../../ui-kit/reminder_home_tile.dart';
import '../../util/AppColors.dart';

class ProfilesView extends ConsumerWidget {
  const ProfilesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfilesController controller =
        ref.read(providers.profilesControllerProvider.notifier);
    final List<ProfilesModel> model =
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
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text("Your Profiles",
                  style: Theme.of(context).textTheme.headline6),
            ),
            for (int i = 0; i <= model.length - 1; i++)
              ProfileTile(model[i].profileName, model[i].active),
          ],
        ),
      ),
    );
  }
}


abstract class ProfilesController extends StateNotifier<List<ProfilesModel>> {
  ProfilesController(List<ProfilesModel> state) : super(state);

  void addProfile(String name);

  void removeProfile(String name);

  void changeName(String name, String newName);

  List<ReminderHomeTile> upcomingReminders();

  List<ReminderHomeTile> remindersToday();
}
