import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

///7 /lib/code6/main_data102.dart
///  Container 的大小限定
class ContainerBodySelfChildPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///7/lib/code6/main_data102.dart
/// Container 的大小限定
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "示例",
        ),
      ),
      body: SizedBox(
//        width: 100,
//        height: 100,
        child: Container(
//          width: 200,
//          height: 200,
          color: Colors.grey,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
