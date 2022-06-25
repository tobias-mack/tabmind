import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/main.dart';
import 'package:tabmind/ui-kit/reminder_home_tile.dart';

import '../../common/providers.dart';
import '../../ui-kit/profile_tile.dart';
import '../../ui-kit/reminder_tile.dart';
import '../../util/AppColors.dart';
import 'home_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  List<ReminderHomeTile> list = [
    ReminderHomeTile("Fentanyl"),
    ReminderHomeTile("Ibuprofen"),
    ReminderHomeTile("Dopamin"),
    ReminderHomeTile("Johanniskraut"),
    ReminderHomeTile("Atorvastatin"),
    ReminderHomeTile("Johanniskraut"),
    ReminderHomeTile("Ibuprofen"),
    ReminderHomeTile("Paracetamol"),
    ReminderHomeTile("Lisinopril"),
  ];

  Widget build(BuildContext context) {

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
                    //decoration: BoxDecoration(
                    //  gradient: LinearGradient(
                    //    begin: Alignment.topCenter,
                    //    end: Alignment.bottomCenter,
                    //    colors: [
                    //      Colors.black.withOpacity(.1),
                    //      Colors.black.withOpacity(.9),
                    //      Colors.black.withOpacity(1),
                    //      Colors.black.withOpacity(1),
                    //      Colors.black.withOpacity(1),
                    //    ],
                    //  ),
                    //),
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
                                    ReminderTile(
                                        image: AssetImage("assets/images/bell.PNG"),
                                        profileName: "Profile 1"),
                                    SizedBox(width: 16),
                                    ReminderTile(
                                        image: AssetImage("assets/images/bell.PNG"),
                                        profileName: "Profile 2"),
                                    SizedBox(width: 16),
                                    ReminderTile(
                                        image: AssetImage("assets/images/bell.PNG"),
                                        profileName: "Profile 3"),
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
                              for (int i = 0; i <= list.length - 1; i++)
                                list[i]
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
