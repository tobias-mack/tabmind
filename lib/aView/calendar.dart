import '../aview_dependencies.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key})
      : con = Controller(),
        super(key: key);
  final Controller con;

  @override
  State createState() => _CalendarPageState();
}

class _CalendarPageState extends StateMVC<CalendarPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Image(
          image:
              AssetImage('assets/tabmind-logos/Logo-Pill-Black-removedbg.png'),
          width: 120,
          height: 50,
        ),
        centerTitle: true,
      ),
    );
  }
}
