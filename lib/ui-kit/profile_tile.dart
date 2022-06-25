import 'package:flutter/material.dart';

import '../util/AppColors.dart';

class ProfileTile extends StatefulWidget {
  final String name;
  bool switcher;

  ProfileTile(this.name, this.switcher, {Key? key}) : super(key: key);

  @override
  _ProfileTileState createState() => _ProfileTileState();
}


class _ProfileTileState extends State<ProfileTile> {


  Widget build(BuildContext context) {

  return GestureDetector(
  onTap: () {
  //TODO: route to profile reminders
  },
    child:
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: ListTile(
              title:
              TextFormField(
                initialValue: widget.name,
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),
                ),
              ),
              trailing: Switch(
                value: widget.switcher,
                activeColor: accentColor,
                onChanged: (bool value) {
                  setState(() {
                    widget.switcher = value;
                  });
                },
              ),
            ),),
      );
    }
}
