
import 'creationPage_model.dart';
import 'creationPage_view.dart';

class CreationPageControllerImplementation extends CreationPageController {
  CreationPageControllerImplementation({CreationPageModel? model})
      : super(
    model ?? const CreationPageModel(),
  );

}