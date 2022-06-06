
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/providers.dart';
import '../../util/AppColors.dart';
import 'creationPage_model.dart';


class CreationPageView extends ConsumerWidget {
  const CreationPageView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreationPageController controller =
    ref.read(providers.creationPageControllerProvider.notifier);
    final CreationPageModel model = ref.watch(providers.creationPageControllerProvider);

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
//         body:  Padding(
//           padding: EdgeInsets.all(80),
//           child: TextFormField(
//             initialValue: 'Input text',
//             decoration: const InputDecoration(
//               labelText: 'Label text',
//               errorText: 'Error message',
//               border: OutlineInputBorder(),
//               suffixIcon: Icon(
//                 Icons.error,
//               ),
//             ),
//           ),
//         ),
//     );
//
//   }
// }
      body: Container(
        width: 300,
        color: Color.fromARGB(100, 200, 200, 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.center,
          //          textBaseline: TextBaseline.alphabetic,
          //          mainAxisSize: MainAxisSize.min,

          children: [
            TextFormField(
              initialValue: 'Input text',
              decoration: InputDecoration(
                labelText: 'Name of Reminder',
                border: OutlineInputBorder(),
              ),
            ),

            MyStatefulWidget(),

            MyStatefulWidget(),

            MyStatefulWidget(),

            TextFormField(
              initialValue: 'Input text',
              decoration: InputDecoration(
                labelText: 'Details/Notes',
                border: OutlineInputBorder(),
              ),
            ),
            MyStatefulWidget(),

            //hier eigentlich Time picker Widget

            OutlinedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

abstract class CreationPageController extends StateNotifier<CreationPageModel> {
  CreationPageController(CreationPageModel state) : super(state);
}
