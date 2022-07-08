import 'package:tabmind/pages/profiles/profiles_model.dart';
import 'package:tabmind/pages/profiles/profiles_view.dart';
import 'package:tabmind/ui-kit/reminder_home_tile.dart';

class ProfilesControllerImplementation extends ProfilesController {

  ProfilesControllerImplementation({List<ProfilesModel>? model})
      : super(
    model ?? List<ProfilesModel>.empty(),
  );

  @override
  void addProfile(String name) {
    ProfilesModel profile = ProfilesModel(
        reminders: [], profileName: name, active: false);
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
    // TODO: implement upcomingReminders
    return [];
  }

  @override
  List<ReminderHomeTile> remindersToday() {
    // TODO: implement remindersToday
    return [];
  }
}
