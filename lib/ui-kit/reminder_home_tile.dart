import 'package:flutter/material.dart';
import 'package:tabmind/pages/reminderDetails/reminderDetails_view.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_view.dart';

import '../util/AppColors.dart';

class ReminderHomeTile extends StatefulWidget {
  final String name;

  ReminderHomeTile(this.name, {Key? key}) : super(key: key);

  @override
  _ReminderHomeTileState createState() => _ReminderHomeTileState();
}

class _ReminderHomeTileState extends State<ReminderHomeTile> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: route to profile reminders
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ReminderDetailsView(widget.name)));
      },
        child: ListTile(
          title: Container(
            margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: myBoxDecoration(),
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.bodyText1!,
            ),
          ),
        ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 1.5
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
      ),
    );
  }

  void showResults(BuildContext context, index) {
    //make like reminder +
  }
}
