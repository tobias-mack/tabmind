
import 'calendar_model.dart';
import 'calendar_view.dart';

class CalendarControllerImplementation extends CalendarController {
  CalendarControllerImplementation({CalendarModel? model})
      : super(
    model ?? const CalendarModel(),
  );

}

