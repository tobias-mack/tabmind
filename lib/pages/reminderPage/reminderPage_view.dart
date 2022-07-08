import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/creationPage/creationPage_view.dart';

import '../../common/providers.dart';
import '../../ui-kit/profile_tile.dart';
import '../../util/AppColors.dart';
import '../creationPage/creationPage_model.dart';
import 'reminderPage_model.dart';


class ReminderPageView extends ConsumerWidget {
   ReminderPageView({Key? key}) : super(key: key);

  List<ProfileTile> list1 = [
    ProfileTile("Ibuprofen", true),
    ProfileTile("Paracetamol", true),
    ProfileTile("Lisinopril", false),
  ];
  List<ProfileTile> list2 = [
    ProfileTile("Atorvastatin", true),
    ProfileTile("Johanniskraut", false),
  ];
  List<ProfileTile> list3 = [
    ProfileTile("Fentanyl", false),
    ProfileTile("Ibuprofen", true),
    ProfileTile("Dopamin", true),
    ProfileTile("Johanniskraut", true),

  ];

  Widget build(BuildContext context, WidgetRef ref) {
    final CreationPageController controller =
    ref.read(providers.creationPageControllerProviderFamily("1").notifier);
    final CreationPageModel model =
    ref.watch(providers.creationPageControllerProviderFamily("1"));

    final int count = 4; //Anzahl an Switches

    return DefaultTabController(
      initialIndex: 1,
      length: list1.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Image(
            image: AssetImage('assets/tabmind-logos/Logo-Black-removedbg.png'),
            width: 120,
            height: 50,
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: accentColor,
            tabs: <Widget>[
              for (int i = 0; i <= list1.length - 1; i++)
                Tab(
                  text: "Profil 1" + i.toString(),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            for (int i = 0; i <= list1.length - 1; i++)
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Your Reminders",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    for (int i = 0; i <= list1.length - 1; i++) list1[i]
                  ],
                ),
              ),
          ],
        ),


        floatingActionButton: FloatingActionButton(
          onPressed:  () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreationPageView()));},
          tooltip: 'tooltip',
          backgroundColor: accentColor,
          child: Icon(Icons.add),
        ),
      ),
    );

  }
}

abstract class ReminderPageController extends StateNotifier<ReminderPageModel> {
  ReminderPageController(ReminderPageModel state) : super(state);

  void addReminder(String name, String dosis, String frequency, String details, String importance, TimeOfDay timeOfDay, bool status){}

}