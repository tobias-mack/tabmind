import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../common/providers.dart';
import '../pages/profiles/profiles_model.dart';
import '../pages/profiles/profiles_view.dart';
import '../pages/reminderDetails/reminderDetails_view.dart';
import '../util/AppColors.dart';

class ReminderTile extends ConsumerWidget {
  final String profileName;
  final String name;
  bool switcher;

  ReminderTile(this.profileName, this.name, this.switcher, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfilesController controller =
        ref.read(providers.profilesControllerProvider.notifier);
    final Box<ProfilesModel> model =
        ref.watch(providers.profilesControllerProvider);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ReminderDetailsView(
                profileName, controller.getReminder(profileName, name))));
      },
      child: Dismissible(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Container(
              margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: myBoxDecoration(),
              child: Text(
                name,
                style: Theme.of(context).textTheme.headline6!,
              ),
            ),
            trailing: Switch(
              value: switcher,
              activeColor: accentColor,
              onChanged: (bool value) {
                controller.toggleReminder(profileName, name);
              },
            ),
          ),
        ),
        onDismissed: (DismissDirection direction) {
          controller.removeReminder(profileName, name);
        },
        key: UniqueKey(),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.0),
      borderRadius: BorderRadius.all(
          Radius.circular(15.0) //                 <--- border radius here
          ),
    );
  }
}
