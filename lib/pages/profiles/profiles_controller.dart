
import 'package:tabmind/pages/profiles/profiles_model.dart';
import 'package:tabmind/pages/profiles/profiles_view.dart';

class ProfilesControllerImplementation extends ProfilesController {
  ProfilesControllerImplementation({ProfilesModel? model})
      : super(
    model ?? const ProfilesModel(),
  );

}

