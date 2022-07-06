import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/common/providers.dart';
import '../../util/AppColors.dart';
import 'creationPage_model.dart';

class CreationPageView extends ConsumerWidget {
  CreationPageView({Key? key}) : super(key: key);

  final controllerName = TextEditingController();
  final controllerDosis = TextEditingController();
  final controllerFrequency = TextEditingController();
  final controllerNotes = TextEditingController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreationPageController controller =
        ref.read(providers.creationPageControllerProviderFamily("1").notifier);
    final CreationPageModel model =
        ref.watch(providers.creationPageControllerProviderFamily("1"));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Image(
          image: AssetImage('assets/tabmind-logos/Logo-Black-removedbg.png'),
          width: 120,
          height: 50,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: accentColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    labelText: 'Name of Reminder',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  controller: controllerDosis,
                  decoration: const InputDecoration(
                    labelText: 'Dosis',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: TextField(
                  controller: controllerFrequency,
                  decoration: const InputDecoration(
                    labelText: 'Frequency',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Text("Select Importance:"),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Dropdown1()
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: TextField(
                  controller: controllerNotes,
                  decoration: const InputDecoration(
                    labelText: 'Details/Notes',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Text("Select Daytime:"),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Dropdown2()
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TimeSelect()
              ),
              const SizedBox(height: 8),
             /* Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  'Selected time: ${_time.format(context)}',
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: add importance and daytime select functionality
                    controller.addReminder(controllerName.text, controllerDosis.text, controllerFrequency.text, controllerNotes.text, Dropdown2State().dropdownValue2, TimeSelectState()._time, true);

                    showDialog(context: context, builder: (context) {
                      return const AlertDialog(
                        content: Text("Reminder Successfully Added"),
                      );
                    });
                  },
                  child: const Text("Create"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Dropdown1 extends StatefulWidget {
  const Dropdown1({Key? key}) : super(key: key);

  @override
  Dropdown1State createState() => Dropdown1State();
}

class Dropdown1State extends State<Dropdown1> {
  @override

  String dropdownValue = "Low";
  String dropdownValue2 = "Select";

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownValue = selectedValue;
      });
    }
  }
  Widget build(BuildContext context) {
    return DropdownButton(
        items: const [
          DropdownMenuItem(child: Text("Low"), value: "Low"),
          DropdownMenuItem(child: Text("High"), value: "High"),
      ],
      value: dropdownValue,
      onChanged: dropdownCallback,
      // Customizatons
      //iconSize: 42.0,
      //iconEnabledColor: Colors.green,
      //icon: const Icon(Icons.flutter_dash),
      //isExpanded: true,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}


class Dropdown2 extends StatefulWidget {
  const Dropdown2({Key? key}) : super(key: key);

  @override
  Dropdown2State createState() => Dropdown2State();
}

class Dropdown2State extends State<Dropdown2> {
  @override

  String dropdownValue2 = "Select";

  void dropdownCallback2(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownValue2 = selectedValue;
      });
    }
  }
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const [
        DropdownMenuItem(child: Text("Morning"), value: "Morning"),
        DropdownMenuItem(child: Text("Midday"), value: "Midday"),
        DropdownMenuItem(child: Text("Night"), value: "Night"),
        DropdownMenuItem(child: Text("Select"), value: "Select"),
      ],
      value: dropdownValue2,
      onChanged: dropdownCallback2,
      // Customizatons
      //iconSize: 42.0,
      //iconEnabledColor: Colors.green,
      //icon: const Icon(Icons.flutter_dash),
      //isExpanded: true,
      //itemHeight: 50.0,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}

class TimeSelect extends StatefulWidget {
  const TimeSelect({Key? key}) : super(key: key);

  @override
  TimeSelectState createState() => TimeSelectState();
}

class TimeSelectState extends State<TimeSelect> {
  @override

  TimeOfDay _time = TimeOfDay.now();


  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _selectTime,
        child: const Text('SELECT TIME'),
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(accentColor)));
  }
}

abstract class CreationPageController extends StateNotifier<CreationPageModel> {
  CreationPageController(CreationPageModel state) : super(state);

  void addReminder(String name, String dosis, String frequency, String details, String importance, TimeOfDay timeOfDay, bool status) {}
  String showReminder();
}
