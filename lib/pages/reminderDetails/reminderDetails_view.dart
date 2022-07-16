import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:tabmind/pages/reminderPage/reminderPage_model.dart';

import '../../common/providers.dart';
import '../../util/AppColors.dart';
import '../profiles/profiles_model.dart';
import '../profiles/profiles_view.dart';

class ReminderDetailsView extends ConsumerWidget {
  final String profileName;
  final ReminderPageModel reminder;

  ReminderDetailsView(this.profileName, this.reminder, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfilesController controller =
        ref.read(providers.profilesControllerProvider.notifier);
    final Box<ProfilesModel> model =
        ref.watch(providers.profilesControllerProvider);

    final controllerName = TextEditingController(text: reminder.name);
    final controllerDosis = TextEditingController(text: reminder.dosis);
    final controllerFrequency = TextEditingController(text: reminder.frequency);
    final controllerNotes = TextEditingController(text: reminder.details);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.changeReminder(
              profileName,
              controllerName.text,
              reminder.name,
              controllerDosis.text,
              controllerFrequency.text,
              controllerNotes.text,
              ImportanceState().dropdownValue,
              TimeSelectState()._time);

          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text("Reminder Successfully Changed"),
                );
              });

          Navigator.pop(context);
        },
        tooltip: 'change data',
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
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
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextFormField(
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 5) {
                        return 'Please enter at least 5 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name of Reminder',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextFormField(
                    controller: controllerDosis,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Dosis',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: TextFormField(
                    controller: controllerFrequency,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some number';
                      } else if (int.parse(value) > 10) {
                        return 'More than 10 intakes should not be possible';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Frequency',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: TextFormField(
                    controller: controllerNotes,
                    decoration: const InputDecoration(
                      labelText: 'Details/Notes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Text("Select Importance:"),
                const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Dropdown1()),
                //const Text("Select Daytime:"),
                //const Padding(
                //  padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                //  child: Dropdown2()
                //),TODO: calculate daytime from given time
                const Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: TimeSelect()),
                const SizedBox(height: 8),
                /* Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  'Selected time: ${_time.format(context)}',
                ),
              ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dropdown1 extends StatefulWidget {
  const Dropdown1({Key? key}) : super(key: key);

  @override
  ImportanceState createState() => ImportanceState();
}

class ImportanceState extends State<Dropdown1> {
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
      initialTime:
          _time, //TODO: time of current reminder.time! otherwise time changes when time is not updated
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
            backgroundColor: MaterialStateProperty.all<Color>(accentColor)));
  }
}
