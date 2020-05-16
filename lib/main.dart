import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'code20/main_data_other.dart';
import 'code3/main_data_appbar.dart';
import 'code5/main_data75.dart';
import 'code6/main_data_conainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter组件精讲与实战',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("目录"),
      ),
      body:
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(12.0),
            child: ListView.builder(itemBuilder: (BuildContext context,int index){
              return buildItemWidget(context,index);
            },itemCount: list.length,),
          ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<CatalogModel> list = [
    new CatalogModel("第4章AppBar组件", MainAppBarPage(), "常用作包裹其他Widget，类似html中的div"),
    new CatalogModel("第6章输入框Textfield", TextFieldMainPage(), "Textfield在Flutter中用来进行文本输入框的功能"),
    new CatalogModel("第7章容器Container", ContainerMainPage(), "常用作包裹其他Widget，类似html中的div"),

    new CatalogModel("第19章常用Widget", OtherWidgetMainPage(), "Transform变换组件、"),

  ];


  Widget buildItemWidget(BuildContext context, int index) {
    CatalogModel catalogModel = list[index];
    return Container(
      height: 80,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(top: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: InkWell(onTap: (){
        NavigatorUtils.pushPage(context, catalogModel.page);
      },child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,children: [
            Container(child: Text(catalogModel.pageTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.0),),),
            Container(child: Text(catalogModel.pageMessage,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 14.0),),)
          ],),),
          Icon(Icons.arrow_forward_ios)
        ],
      ),),
    );
  }
}


class CatalogModel{
  String pageTitle;
  Widget page;
  String pageMessage;

  CatalogModel(this.pageTitle, this.page, this.pageMessage);

}

