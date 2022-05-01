import '../aview_dependencies.dart';

class ProfilesPage extends StatefulWidget {
  ProfilesPage({Key? key})
      : con = Controller(),
        super(key: key);
  final Controller con;

  @override
  State createState() => _ProfilesPageState();
}

class _ProfilesPageState extends StateMVC<ProfilesPage> {
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
    return const Scaffold();
  }
}
