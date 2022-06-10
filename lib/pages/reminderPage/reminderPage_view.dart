import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/creationPage/creationPage_view.dart';

import '../../util/AppColors.dart';
import 'reminderPage_model.dart';


class ReminderPageView extends StatefulWidget {
  const ReminderPageView({Key? key}) : super(key: key);
  @override
  _ReminderPageViewState createState() => _ReminderPageViewState();
}

class _ReminderPageViewState extends State<ReminderPageView> {
  List<bool> _values = [true, false, true, false, false];

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
        onPressed:  () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreationPageView()));},
        tooltip: 'tooltip',
        backgroundColor: accentColor,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          for (int i = 0; i <= count; i++)
            ListTile(
              title: Text(
                'Reminder ${i + 1}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black),
              ),
              leading: Switch(
                value: _values[i],
                activeColor: accentColor,
                onChanged: (bool value) {
                  setState(() {
                    _values[i] = value;
                  });
                },
              ),
            ),
        ],
      ),
    );

  }
}

abstract class ReminderPageController extends StateNotifier<ReminderPageModel> {
  ReminderPageController(ReminderPageModel state) : super(state);

  void addReminder(String name, String dosis, String frequency, String details, String importance, TimeOfDay timeOfDay, bool status){}

}