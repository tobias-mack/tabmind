import 'package:tabmind/aView/calendar.dart';
import 'package:tabmind/aView/home.dart';
import 'package:tabmind/aView/profiles.dart';
import 'package:tabmind/aView/reminder.dart';
import 'package:tabmind/aview_dependencies.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key})
      : con = Controller(),
        super(key: key);
  final Controller con;

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends StateMVC<MainPage> {
  int currentIndex = 0;

  //
  @override
  void initState() {
    /// Link with the StateMVC so con.setState(() {}) will work.
    add(widget.con);
    con = controller as Controller;

    /// Allow the con.initState() to be called.
    super.initState();
  }

  late Controller con;


  final pages = [
    HomePage(),
    ReminderPage(),
    CalendarPage(),
    ProfilesPage(),
  ];


  @override
  Widget build(_) {
    // Takes this state object as a dependency to an InheritedWidget.
    // Only useful if buildInherited() is used instead of setState().

    return Scaffold(

      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: con.accentColor,
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.doorbell), label: 'Reminder'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Profiles'),
        ],
      ),
    );
  }
}