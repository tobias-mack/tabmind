
import 'home_model.dart';
import 'home_view.dart';

class HomeControllerImplementation extends HomeController {
  HomeControllerImplementation({HomeModel? model})
      : super(
    model ?? const HomeModel(),
  );

}
