import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/pages/calendar/calendar_view.dart';
import 'package:tabmind/pages/creationPage/creationPage_view.dart';
import 'package:tabmind/pages/home/home_view.dart';
import 'package:tabmind/pages/profiles/profiles_view.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_view.dart';
import 'package:tabmind/util/AppColors.dart';

void main() async {
  runApp(await buildApp());
}

Future<Widget> buildApp() async {
  return UncontrolledProviderScope(
    container: ProviderContainer(),
    child: const MyApp(),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: MainView(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          selectedItemColor: accentColor,
          unselectedItemColor: Colors.white38,
        ),
      ),
    );
  }
}


class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

/*ElevatedButton(
onPressed:  () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondRoute()));},
child: Text('Navigate to a new screen >>', style: TextStyle(fontSize: 24.0),),
),*/

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final _homeScreen = GlobalKey<NavigatorState>();
  final _reminderScreen = GlobalKey<NavigatorState>();
  final _calendarScreen = GlobalKey<NavigatorState>();
  final _profilesScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _homeScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomeView(),
            ),
          ),
          Navigator(
            key: _reminderScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const ReminderPageView(),
            ),
          ),
          Navigator(
            key: _calendarScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const CalendarView(),
            ),
          ),
          Navigator(
            key: _profilesScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const ProfilesView(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: accentColor,
        onTap: (val) => _onTap(val, context),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.doorbell), label: 'Reminder'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Profiles'),
        ],
      ),
    );
  }

  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      switch (val) {
        case 0:
          _homeScreen.currentState?.popUntil((route) => route.isFirst);
          break;
        case 1:
          _reminderScreen.currentState?.popUntil((route) => route.isFirst);
          break;
        case 2:
          _calendarScreen.currentState?.popUntil((route) => route.isFirst);
          break;
        case 3:
          _profilesScreen.currentState?.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }
}
/*
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}*/
