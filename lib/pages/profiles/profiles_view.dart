import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';

import '../../util/AppColors.dart';


class ProfilesView extends ConsumerWidget {
  const ProfilesView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {

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

      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'tooltip',
        backgroundColor: accentColor,
        child: Icon(Icons.add),
      ),
    );

  }
}

abstract class ProfilesController extends StateNotifier<ProfilesModel> {
  ProfilesController(ProfilesModel state) : super(state);
}