
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
        body:  Padding(
          padding: EdgeInsets.all(80),
          child: TextFormField(
            initialValue: 'Input text',
            decoration: const InputDecoration(
              labelText: 'Label text',
              errorText: 'Error message',
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.error,
              ),
            ),
          ),
        ),
    );

  }
}


abstract class CreationPageController extends StateNotifier<CreationPageModel> {
  CreationPageController(CreationPageModel state) : super(state);
}
