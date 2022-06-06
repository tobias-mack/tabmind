import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabmind/main.dart';

import '../../common/providers.dart';
import '../../util/AppColors.dart';
import 'home_model.dart';


class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
    ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

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
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'tooltip',
        backgroundColor: accentColor,
        child: Icon(Icons.add),
      ),
      body: Column(children: [ TextFormField(
        initialValue: 'Name',
        maxLength: 20,
        decoration: const InputDecoration(
          constraints: BoxConstraints(maxHeight: 50, maxWidth: 100),
          border: OutlineInputBorder(
            borderSide: BorderSide (color: accentColor)
          ),
          labelText: 'Name',
        ),
      ),
      ],)

    );

  }
}


abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);

}