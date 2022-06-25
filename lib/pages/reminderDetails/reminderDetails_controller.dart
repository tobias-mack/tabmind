import 'package:tabmind/pages/reminderDetails/reminderDetails_model.dart';
import 'package:tabmind/pages/reminderDetails/reminderDetails_view.dart';

class ReminderDetailsControllerImplementation extends ReminderDetailsController {
  ReminderDetailsControllerImplementation({ReminderDetailsModel? model})
      : super(
    model ?? const ReminderDetailsModel(),
  );

}