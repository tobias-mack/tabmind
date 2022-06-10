import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../util/AppColors.dart';
import 'reminderPage_model.dart';


class ReminderPageView extends ConsumerWidget {
  const ReminderPageView({Key? key}) : super(key: key);



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

abstract class ReminderPageController extends StateNotifier<ReminderPageModel> {
  ReminderPageController(ReminderPageModel state) : super(state);

  void addReminder(String name, String dosis, String frequency, String details, String importance, TimeOfDay timeOfDay, bool status){}

}