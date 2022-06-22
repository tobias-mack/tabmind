import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/home/home_controller.dart';
import '../pages/home/home_model.dart';
import '../pages/home/home_view.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplementation());
}
