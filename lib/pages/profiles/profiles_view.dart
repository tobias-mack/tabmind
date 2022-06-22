import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';

import '../../common/providers.dart';
import '../../ui-kit/profile_tile.dart';
import '../../util/AppColors.dart';

class ProfilesView extends StatefulWidget {
  const ProfilesView({Key? key}) : super(key: key);

  @override
  State<ProfilesView> createState() => _ProfilesViewState();
}

class _ProfilesViewState extends State<ProfilesView> {
  List<bool> _values = [true, false, true, false, false];
  List<ProfileTile> list = [
    ProfileTile("Profile 1", true),
    ProfileTile("Profile 2", true),
    ProfileTile("Profile 3", false),
  ];

  Widget build(BuildContext context) {
    final int count = 4; //Anzahl an Switches

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
          addProfile();
        },
        tooltip: 'tooltip',
        backgroundColor: accentColor,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Your Profiles",
                style: Theme.of(context).textTheme.headline6),
            ),

          for (int i = 0; i <= list.length - 1; i++)
            list[i]

        ],
      ),
    );
  }

  void addProfile() {
    setState(() {
      list.add(ProfileTile("name", false));
    });
  }
}

abstract class ProfilesController extends StateNotifier<ProfilesModel> {
  ProfilesController(ProfilesModel state) : super(state);
}
