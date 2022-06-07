
import 'reminderPage_model.dart';
import 'reminderPage_view.dart';

class ReminderPageControllerImplementation extends ReminderPageController {
  ReminderPageControllerImplementation({ReminderPageModel? model})
      : super(
    model ?? const ReminderPageModel(),
  );

}