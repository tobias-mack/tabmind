import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabmind/local_persistence/hive_service.dart';
import 'package:tabmind/pages/profiles/profiles_model.dart';

class HiveServiceImplementation implements HiveService {
  //late final Box<AlbumModel> _albums;
  //static const String boxName = 'albums';

  HiveServiceImplementation();

  initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProfileModelAdapter());
    //_albums = await Hive.openBox(boxName);
  }

  //@override
  //List<AlbumModel> getAllAlbums() => _albums.values.toList();

  @override
  void clearAll() {
    //_albums.clear();
  }
}
