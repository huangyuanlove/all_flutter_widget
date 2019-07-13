import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/one/inherited_test_model.dart';

class InheritedModelContext extends InheritedWidget {
  final InheritedTestModel model;

  InheritedModelContext({Key key, @required this.model, @required Widget child})
      : super(key: key, child: child);

  static InheritedModelContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedModelContext);
  }

  @override
  bool updateShouldNotify(covariant InheritedModelContext oldWidget) {
    print("updateShouldNotify in InheritedModelContext");
    return false;
  }
}
