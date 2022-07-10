import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/reminderDetails/reminderDetails_view.dart';

import '../common/providers.dart';
import '../pages/profiles/profiles_model.dart';
import '../pages/profiles/profiles_view.dart';

class ReminderHomeTile extends ConsumerWidget {
  final String profilName;
  final String name;
  bool switcher;
  TimeOfDay timeOfDay = TimeOfDay.now();

  ReminderHomeTile(this.profilName, this.name, this.switcher, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfilesController controller =
        ref.read(providers.profilesControllerProvider.notifier);
    final List<ProfilesModel> model =
        ref.watch(providers.profilesControllerProvider);

    var reminder = controller.getReminder(profilName, name);
    timeOfDay = reminder.timeOfDay;
    return GestureDetector(
      onTap: () {
        //TODO: route to profile reminders
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ReminderDetailsView(profilName, reminder)));
      },
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
        ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 1.0),
      borderRadius: BorderRadius.all(
          Radius.circular(15.0) //                 <--- border radius here
          ),
    );
  }

  void showResults(BuildContext context, index) {
    //make like reminder +
  }
}
