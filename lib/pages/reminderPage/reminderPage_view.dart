import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tabmind/pages/creationPage/creationPage_view.dart';

import '../../common/providers.dart';
import '../../local_persistence/Boxes.dart';
import '../../ui-kit/reminder_tile.dart';
import '../../util/AppColors.dart';
import '../profiles/profiles_model.dart';
import '../profiles/profiles_view.dart';
import 'reminderPage_model.dart';

class ReminderPageView extends ConsumerWidget {
  ReminderPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfilesController controller =
        ref.read(providers.profilesControllerProvider.notifier);
    final Box<ProfilesModel> model =
        ref.watch(providers.profilesControllerProvider);

    return ValueListenableBuilder<Box<ProfilesModel>>(
        valueListenable: Boxes.getProfiles().listenable(),
        builder: (context, box, _) {
          final profiles = box.values.toList().cast<ProfilesModel>();
          return DefaultTabController(
            initialIndex: 1,
            length: model.length,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Image(
                  image: AssetImage(
                      'assets/tabmind-logos/Logo-Black-removedbg.png'),
                  width: 120,
                  height: 50,
                ),
                centerTitle: true,
                bottom: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: accentColor,
                  tabs: <Widget>[
                    for (int i = 0; i <= model.values.length - 1; i++)
                      Tab(
                        text: model.values.elementAt(i).profileName,
                      ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  for (int i = 0; i <= profiles.length - 1; i++)
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("Your Reminders",
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            for (ReminderPageModel reminder
                                in model.values.elementAt(i).reminders)
                              ReminderTile(
                                  model.values.elementAt(i).profileName,
                                  reminder.name,
                                  reminder.status),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              child: Column(
                                children: [
                                  Center(
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreationPageView(model
                                                        .values
                                                        .elementAt(i)
                                                        .profileName)));
                                      },
                                      backgroundColor: accentColor,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            //floatingActionButton: FloatingActionButton(
            //  onPressed:  () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreationPageView()));},
            //  tooltip: 'create a new reminder for the selected profile',
            //  backgroundColor: accentColor,
            //  child: Icon(Icons.add),
            //),
          );
        });
  }
}

abstract class ReminderPageController extends StateNotifier<ReminderPageModel> {
  ReminderPageController(ReminderPageModel state) : super(state);
}
