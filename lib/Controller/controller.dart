import 'package:tabmind/controller_dependencies.dart';

class Controller extends ControllerMVC {
  factory Controller([StateMVC? state]) => _this ??= Controller._(state);
  Controller._(StateMVC? state)
      : _model = Model(),
        super(state);

  static Controller? _this;
  final Model _model;

  /// Note, the count comes from a separate class, _Model.
  int get count => _model.counter;

  Color get accentColor => _model.accentColor;
  // The Controller knows how to 'talk to' the Model and to the View (interface).
  void incrementCounter() {
    //
    _model.incrementCounter();

    /// Retrieve a particular State object. The rest is ignore if not at 'HomePage'


    /// Just rebuild an InheritedWidget's dependencies.
    buildInherited();
  }

  /// Call the State object's setState() function to reflect the change.

}