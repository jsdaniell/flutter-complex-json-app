import 'package:example_flutter/models/property_scoped_model.dart';
import 'package:example_flutter/screens/SearchScreen.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final PropertyScopedModel propertyScopedModel = PropertyScopedModel();

  @override
  Widget build(BuildContext context) {
    propertyScopedModel.initializeValues();
    return ScopedModel<PropertyScopedModel>(
      model: propertyScopedModel,
      child: MaterialApp(
        title: "Finder",
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrange,
        ),
        home: SearchScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
