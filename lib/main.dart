import 'package:flutter/material.dart';
import 'first.dart';

void main() => (runApp(getWidgetFlutterModule("", "")));

Widget getWidgetFlutterModule(String pageName, String query) {
  if(pageName == "mainPage") {
    int index = query.indexOf("haveNav=1");
    if(index != -1) { //接收到参数，这里简单处理，直接跳转到有导航栏的界面
      return MyModule2();
    } 
  }
  return Center(
    child: Text('Unknown pageName: $pageName', textDirection: TextDirection.ltr),
  );
}