

import 'package:tabmind/model_dependencies.dart';

class Model extends ModelMVC {
  factory Model([StateMVC? state]) => _this ??= Model._(state);
  Model._(StateMVC? state) : super(state);

  static Model? _this;

  int get counter => _counter;
  int _counter = 12;

  int incrementCounter() => ++_counter;

  final words = [
    'Hello There!',
    'How are you?',
    'Are you good?',
    'All the best.',
    'Bye for now.'
  ];
  int _index = 0;

  String sayHello() {
    String say;
    if (_index < words.length) {
      say = words[_index];
      _index++;
    } else {
      say = '';
    }
    return say;
  }
}