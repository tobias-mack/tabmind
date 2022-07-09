import 'package:flutter/material.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_view.dart';

import '../util/AppColors.dart';

class ProfileHomeTile extends StatelessWidget {
  final AssetImage image;
  final String profileName;

  const ProfileHomeTile({
    Key? key,
    required this.image,
    required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ReminderPageView()));
      },
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  accentColor.withOpacity(.2),
                  accentColor.withOpacity(.6),
                  accentColor.withOpacity(.7),
                  accentColor.withOpacity(.7),
                  accentColor.withOpacity(.7),
                  accentColor.withOpacity(.6),
                  accentColor.withOpacity(.3),
                ],
              ),
              border: Border.all(
                color: Colors.black,
                width: 1.5,
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
