import '../aview_dependencies.dart';

class ReminderPage extends StatefulWidget {
  ReminderPage({Key? key})
      : con = Controller(),
        super(key: key);
  final Controller con;

  @override
  State createState() => _ReminderPageState();
}

class _ReminderPageState extends StateMVC<ReminderPage> {
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

  void _newReminder() {
    setState(() {
      //business logic
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Image(
          image: AssetImage('assets/tabmind-logos/Logo-Pill-Red-removedbg.png'),
          width: 120,
          height: 50,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newReminder,
        tooltip: 'new Reminder',
        backgroundColor: con.accentColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}