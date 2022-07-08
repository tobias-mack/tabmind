import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/providers.dart';
import '../pages/profiles/profiles_model.dart';
import '../pages/profiles/profiles_view.dart';
import '../util/AppColors.dart';

class ProfileTile extends ConsumerWidget {
  final String name;
  bool switcher;

  ProfileTile(this.name, this.switcher, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfilesController controller =
        ref.read(providers.profilesControllerProvider.notifier);
    final List<ProfilesModel> model =
        ref.watch(providers.profilesControllerProvider);

    return GestureDetector(
      onTap: () {
        //TODO: route to profile reminders
      },
      child: Dismissible(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: TextFormField(
              onFieldSubmitted: (text) {
                controller.changeName(name, text);
              },
              initialValue: name,
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),
              ),
            ),
            trailing: Switch(
              value: switcher,
              activeColor: accentColor,
              onChanged: (bool value) {
                profileActivated(value, model, controller);
              },
            ),
          ),
        ),
        onDismissed: (DismissDirection direction) {
          controller.removeProfile(name);
        },
        key: UniqueKey(),
      ),
    );
  }

  void profileActivated(
      bool value, List<ProfilesModel> model, ProfilesController controller) {
    List<ProfilesModel> newList = [];

    for (ProfilesModel profile in model) {
      if (profile.profileName == name) {
        profile = profile.copyWith(active: value);
        newList.add(profile);
      } else {
        newList.add(profile);
      }
    }

    switcher = value;
    controller.state = newList;
  }
}
