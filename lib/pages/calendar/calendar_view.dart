import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tabmind/ui-kit/calendar_table.dart';

import '../../common/providers.dart';
import '../../util/AppColors.dart';
import 'calendar_model.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarController controller =
        ref.read(providers.calendarControllerProvider.notifier);
    final CalendarModel model = ref.watch(providers.calendarControllerProvider);

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Image(
            image: AssetImage('assets/tabmind-logos/Logo-Black-removedbg.png'),
            width: 120,
            height: 50,
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: accentColor,
            tabs: <Widget>[
              Tab(
                text: "Profil 1",
              ),
              Tab(
                text: "Profil 2",
              ),
              Tab(
                text: "Profil 3",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: CalendarTable(),
            ),
            Center(
              child: CalendarTable(),
            ),
            Center(
              child: CalendarTable(),
            ),
          ],
        ),
        //Padding(
        //  padding: const EdgeInsets.all(16.0),
        //  child: Text(
        //    "Your Calendar",
        //    style: Theme.of(context).textTheme.headline6,
        //  ),
        //),
      ),
    );
  }
}

abstract class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state) : super(state);
}
