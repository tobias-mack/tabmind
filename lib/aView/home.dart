import '../aview_dependencies.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key})
      : con = Controller(),
        super(key: key);
  final Controller con;

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
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

  void _incrementCounter() {
    setState(() {
      con.incrementCounter();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Image(
          image: AssetImage('assets/tabmind-logos/Logo-Black-removedbg.png'),
          width: 120,
          height: 50,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              'You have pushed the button this many times:',
            ),
          ),
          Flexible(
            child: Text(
              '${con.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: con.accentColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
