import 'package:hive/hive.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';

class Boxes {
  static Box<ProfilesModel> getProfiles() =>
      Hive.box<ProfilesModel>('profiles');
}
