import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'code1/main_materiapp.dart';
import 'code10/main_data_ui_layout.dart';
import 'code11/main_data_check_box.dart';
import 'code12/main_data_radio.dart';
import 'code13/main_data_gesture.dart';
import 'code14/main_data_switch.dart';
import 'code15/main_data_scrollview.dart';
import 'code16/main_data_listview.dart';
import 'code17/main_data_girdview.dart';
import 'code18/main_data_clip.dart';
import 'code20/main_data_other_transform.dart';
import 'code21/main_data_canvas.dart';
import 'code22/main_data_other.dart';
import 'code23/main_data_animation.dart';
import 'code3/main_data_appbar.dart';
import 'code3/main_data_scffold.dart';
import 'code4/main_data_text.dart';
import 'code5/main_data75.dart';
import 'code6/main_data_conainer.dart';
import 'code7/main_data_button.dart';
import 'code9/image_main_page.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter组件精讲与实战',
      locale: const Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        ///Button使用的样式配置
        buttonTheme: ButtonThemeData()
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
    new CatalogModel("第2章MaterialApp组件", MaterialAppMainPage(), ""),
    new CatalogModel("第3章Scaffold组件", ScaffoldWidgetMainPage(), "常用作包裹其他Widget，类似html中的div，内容涉及BottomAppBar与悬浮按钮结合使用，与PageView、TabbarView结合使用实现标签页面"),
    new CatalogModel("第4章AppBar组件", MainAppBarPage(), "常用作包裹其他Widget，类似html中的div"),
    new CatalogModel("第5章文本Text组件", TextMainPage(), ""),
    new CatalogModel("第6章输入框Textfield", TextFieldMainPage(), "Textfield在Flutter中用来进行文本输入框的功能"),
    new CatalogModel("第7章容器Container", ContainerMainPage(), "常用作包裹其他Widget，类似html中的div"),
    new CatalogModel("第8章按钮Button", ButtonMainPage(), "MaterialButton的使用分析"),

    new CatalogModel("第9章UI布局", UilayoutWidgetMainPage(), "线性布局Column、Row、"),
    new CatalogModel("第10章图片Image组件", ImageMainPage(), "加载资源文件、图片添加水印、widget生成图片"),
    new CatalogModel("第11章复选框CheckBox组件", CheckBoxMainPage(), "复选框组件、自定义复选框组件、仿开源中国的注册页面"),
    new CatalogModel("第12章单选框Radio组件", RadioMainPage(), "单选框组件、自定义单选选框组件"),
    new CatalogModel("第13章手势处理", GestureDetectorMainPage(), "GestureDetector、Ink、InkWell"),

    new CatalogModel("第14章开关", SwitchWidgetMainPage(), ""),
    new CatalogModel("第15章 滑动视图ScrollView", ScrollViewMainPage(), ""),
    new CatalogModel("第16章 列表ListView", ListViewMainPage(), ""),
    new CatalogModel("第17章 GridView九宫格组件", GridViewMainPage(), ""),
    new CatalogModel("第18章 Clip裁剪组件系列", ClipViewMainPage(), ""),


    new CatalogModel("第19章矩阵变换t", OtherTransformWidgetMainPage(), "Transform变换组件、"),
    new CatalogModel("第20章绘图", CanvasWidgetMainPage(), "绘图基础、绘制坐标轴"),
    new CatalogModel("第21章动画", AnimationWidgetMainPage(), "动画 、"),
    new CatalogModel("第22章其他Widget", OtherWidgetMainPage(), "Transform变换组件、"),

  ];


  Widget buildItemWidget(BuildContext context, int index) {
    CatalogModel catalogModel = list[index];
    return Container(
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

