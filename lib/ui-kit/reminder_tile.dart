import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  final AssetImage image;
  final String profileName;

  const ReminderTile({
    Key? key,
    required this.image,
    required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: route to profile reminders
      },
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Image(
                image: image,
                width: 70,
                height: 70,
              ),
            ),
          ),
          Text(
            profileName,
            style: Theme.of(context).textTheme.caption,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
