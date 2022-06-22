import 'package:flutter/material.dart';

import '../util/AppColors.dart';

class ProfileTile extends StatelessWidget {
  final String name;
  bool switcher;

  ProfileTile(this.name, this.switcher, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return GestureDetector(
  onTap: () {
  //TODO: route to profile reminders
  },
    child:
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: ListTile(
              title: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    ,
              ),
              trailing: Switch(
                value: switcher,
                activeColor: accentColor,
                onChanged: (bool value) {
                  //setState(() {
                  //  _values[i] = value;
                  //});
                },
              ),
            ),),
      );
    }
}
