import 'package:flutter/material.dart';
import 'app/app.dart';


void main() {
  runApp(RootApp());
  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return new Center(child: new Text("App错误，快去反馈给作者!"));
  };
}

