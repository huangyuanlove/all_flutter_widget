import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/single_page_model.dart';

class InheritedContext extends InheritedWidget {

 final SinglePageModel model;

  InheritedContext({
    Key key,
    @required this.model,
    @required Widget child
  }) :super(key: key, child: child);


  static InheritedContext of(BuildContext context){
    return context.inheritFromWidgetOfExactType(InheritedContext);
  }


  @override
  bool updateShouldNotify(InheritedContext oldWidget) {

    print("model:${model.page},${model.content}");
    print("oldWi:${oldWidget.model.page},${oldWidget.model.content}");

    return model.page != oldWidget.model.page ||
        model.content != oldWidget.model.content;
  }

}