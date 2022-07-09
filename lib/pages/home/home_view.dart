import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/ui-kit/reminder_home_tile.dart';

import '../../common/providers.dart';
import '../../ui-kit/profile_home_tile.dart';
import '../../util/AppColors.dart';
import '../profiles/profiles_model.dart';
import '../profiles/profiles_view.dart';
import 'home_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/background.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  //decoration: const BoxDecoration(
                  // color: accentColor,
                  //),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "All Reminders",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    for (int i = 0; i <= model.length - 1; i++)
                                      Row(
                                        children: [
                                          ProfileHomeTile(
                                              image: const AssetImage(
                                                  "assets/images/bell.PNG"),
                                              profileName:
                                                  model[i].profileName),
                                          const SizedBox(width: 16),
                                        ],
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Upcoming Reminders",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              for (ReminderHomeTile upcomingReminder
                                  in controller.upcomingReminders())
                                upcomingReminder
                            ],
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Reminders Today",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              for (ReminderHomeTile upcomingReminder
                                  in controller.remindersToday())
                                upcomingReminder
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'tooltip',
        backgroundColor: accentColor,
        child: Icon(Icons.add),
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);
}
