import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../util/AppColors.dart';
import 'creationPage_model.dart';

class CreationPageView extends StatefulWidget {
  const CreationPageView({Key? key}) : super(key: key);

  @override
  State<CreationPageView> createState() => _CreationPageViewState();
}

class _CreationPageViewState extends State<CreationPageView> {
  String dropdownValue = "Low";
  String dropdownValue2 = "Select";
  TimeOfDay _time = TimeOfDay.now();

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownValue = selectedValue;
      });
    }
  }

  void dropdownCallback2(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownValue2 = selectedValue;
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  initialValue: '',
                  decoration: InputDecoration(
                    labelText: 'Name of Reminder',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  initialValue: '',
                  decoration: InputDecoration(
                    labelText: 'Dosis',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: TextFormField(
                  initialValue: '',
                  decoration: InputDecoration(
                    labelText: 'Frequency',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text("Select Importance:"),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: DropdownButton(
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
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: TextFormField(
                  initialValue: '',
                  decoration: InputDecoration(
                    labelText: 'Details/Notes',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text("Select Daytime:"),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: DropdownButton(
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
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: ElevatedButton(
                    onPressed: _selectTime,
                    child: Text('SELECT TIME'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(accentColor))),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  'Selected time: ${_time.format(context)}',
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text("Create"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class CreationPageController extends StateNotifier<CreationPageModel> {
  CreationPageController(CreationPageModel state) : super(state);
}
