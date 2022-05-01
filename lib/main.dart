
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tabmind/Controller/controller.dart';
import 'aView/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends AppStatefulWidgetMVC {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }

  @override
  AppStateMVC createState() => _MyAppState();
}

class _MyAppState extends AppStateMVC<MyApp> {
  //
  factory _MyAppState() => _this ??= _MyAppState._();

  _MyAppState._()
      : super(
          controller: Controller(),
          /// Demonstrate passing an 'object' down the Widget tree much like
          /// in the Scoped Model
          object: 'Hello!',
        );
  static _MyAppState? _this;

  /// Try these different 'build' functions and get access
  /// to a built-in FutureBuilder and or a 'app leve' InheritedWidget.
  /// Override build() and stay with the traditional Flutter approach.
  // @override
  // Widget build(BuildContext context) => MaterialApp(
  //   home: Page1(key: UniqueKey()),
  // );

  /// Override buildWidget() and implement initAsync() and use a FutureBuilder
  /// to perform asynchronous operations while the app starts up.
  // @override
  // Widget buildWidget(BuildContext context) => MaterialApp(
  //       home: Page1(key: UniqueKey()),
  //     );

  /// Override buildChild() to use the FutureBuilder again but also
  /// the built-in InheritedWidget.
  @override
  Widget buildChild(BuildContext context) => MaterialApp(
        home: MainPage(key: UniqueKey()),
      );

  /// Deprecated. To be replaced by buildChild().
  @override
  Widget buildApp(BuildContext context) => MaterialApp(
        home: MainPage(key: UniqueKey()),
      );
}