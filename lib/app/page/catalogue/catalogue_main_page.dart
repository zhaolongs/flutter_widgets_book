import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_catalog.dart';
import 'package:flutterbookcode/app/page/catalogue/read_book_page.dart';
import 'package:flutterbookcode/code1/main_materiapp.dart';
import 'package:flutterbookcode/code10/main_data_ui_layout.dart';
import 'package:flutterbookcode/code11/main_data_check_box.dart';
import 'package:flutterbookcode/code12/main_data_radio.dart';
import 'package:flutterbookcode/code13/main_data_gesture.dart';
import 'package:flutterbookcode/code14/main_data_switch.dart';
import 'package:flutterbookcode/code15/drag/drag_container.dart';
import 'package:flutterbookcode/code15/drag/drag_controller.dart';
import 'package:flutterbookcode/code15/main_data_scrollview.dart';
import 'package:flutterbookcode/code16/main_data_listview.dart';
import 'package:flutterbookcode/code17/main_data_girdview.dart';
import 'package:flutterbookcode/code18/main_data_clip.dart';
import 'package:flutterbookcode/code20/main_data_other_transform.dart';
import 'package:flutterbookcode/code21/main_data_canvas.dart';
import 'package:flutterbookcode/code22/main_data_other.dart';
import 'package:flutterbookcode/code23/main_data_animation.dart';
import 'package:flutterbookcode/code3/main_data_appbar.dart';
import 'package:flutterbookcode/code3/main_data_scffold.dart';
import 'package:flutterbookcode/code4/main_data_text.dart';
import 'package:flutterbookcode/code5/main_data75.dart';
import 'package:flutterbookcode/code6/main_data_conainer.dart';
import 'package:flutterbookcode/code7/main_data_button.dart';
import 'package:flutterbookcode/code9/image_main_page.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
import 'package:flutterbookcode/utils/color_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';

import 'catalogue_drag_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

///lib/app/page/catalogue/catalogue_main_page.dart
///目录主页面
class CatalogueMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogueMainPageState();
  }
}

class _CatalogueMainPageState extends State<CatalogueMainPage>  with AutomaticKeepAliveClientMixin{
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;
  ///抽屉控制器
  DragController dragController = new DragController();
  ///初始化目录页面
  List<CatalogBean> list = [
    new CatalogBean("第1章综述", MaterialAppMainPage(), ""),
    new CatalogBean("第2章MaterialApp组件", MaterialAppMainPage(), "浅谈Provider进行状态管理 引用数据并实现数据的修改,MultiProvider 、ChangeNotifierProvider 的使用，路由routes配置，路由观察者，样式ThemData精讲，多主题适配，多语言环境配制，StatefulWidget 、Context 、State，Widget的分析"),
    new CatalogBean("第3章Scaffold组件", ScaffoldWidgetMainPage(),
        "常用作包裹其他Widget，类似html中的div，内容涉及BottomAppBar与悬浮按钮结合使用，与PageView、TabbarView结合使用实现标签页面，底部标签栏bottomSheet"),
    new CatalogBean(
        "第4章AppBar组件", MainAppBarPage(), "常用作包裹其他Widget，类似html中的div"),
    new CatalogBean("第5章文本Text组件", TextMainPage(), "文本显示组件的基本使用，样式组件TextStyle的使用分析， Text中文字对齐方式，富文本RichText组件的使用分析，富文本RichText使用案例，文本标签"),
    new CatalogBean("第6章输入框Textfield", TextFieldMainPage(),
        "Textfield的基本使用，输入的文字不可见，弹出键盘类型配制，键盘输入框样式，焦点控制，输入字数与行数控制，Textfield在Flutter中用来进行文本输入框的功能"),

    new CatalogBean(
        "第7章容器Container", ContainerMainPage(), "常用作包裹其他Widget，类似html中的div，Container组件的内外边距，Container组件decoration应用，自定义ShapeBorder，AnimatedContainer的基本使用， ConstrainedBox组件的使用分析"),

    new CatalogBean("第8章按钮Button", ButtonMainPage(), "MaterialButton的使用分析，FloatingActionButton，IconButton系列，8.4 自定义动画效果按钮AnimatedButton，8.5 自定义进度交互的动画按钮"),
    new CatalogBean("第9章UI布局", UilayoutWidgetMainPage(), "线性布局Column、Row、弹性布局Flex，流式布局Wrap，基于Wrap实现的tag标签使用， 流式布局Flow，层叠布局Stack"),
    new CatalogBean(
        "第10章图片Image组件", ImageMainPage(), "加载资源文件、图片添加水印、widget生成图片"),
    new CatalogBean(
        "第11章复选框CheckBox组件", CheckBoxMainPage(), "复选框组件、自定义复选框组件、仿开源中国的注册页面"),
    new CatalogBean("第12章单选框Radio组件", RadioMainPage(), "单选框组件、自定义单选选框组件"),
    new CatalogBean(
        "第13章手势处理", GestureDetectorMainPage(), "GestureDetector、Ink、InkWell"),
    new CatalogBean("第14章开关", SwitchWidgetMainPage(), ""),
    new CatalogBean("第15章 滑动视图ScrollView", ScrollViewMainPage(), ""),
    new CatalogBean("第16章 列表ListView", ListViewMainPage(), ""),
    new CatalogBean("第17章 GridView九宫格组件", GridViewMainPage(), ""),
    new CatalogBean("第18章 Clip裁剪组件系列", ClipViewMainPage(), ""),
    new CatalogBean(
        "第19章矩阵变换t", OtherTransformWidgetMainPage(), "Transform变换组件、"),
    new CatalogBean("第20章绘图", CanvasWidgetMainPage(), "绘图基础、绘制坐标轴"),
    new CatalogBean("第21章动画", AnimationWidgetMainPage(), "动画 、"),
    new CatalogBean("第22章其他Widget", OtherWidgetMainPage(), "Transform变换组件、水平分割线的基本使用、"),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      for (var i = 0; i < list.length; i++) {
        widgetList.add(buildCurrentWidget(i));
      }
      setState(() {});
    });
  }
  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///构建翻书效果的子Item
  buildCurrentWidget(int index) {
    CatalogBean bean = list[index];
    ///获取随机字体颜色
    Color textColor = getRandomColor();
    ///每一页的背景颜色
    Color backgroundColor = Colors.blueGrey;
    if(index%2==0){
      backgroundColor = Colors.white;
    }
    return Container(
      ///设置子Item的宽度
      width: MediaQuery.of(context).size.width - 44,
      ///设置子Item的高度
      height: 250,
      ///左右外边距
      margin: EdgeInsets.only(left: 20, right: 20),
      ///圆角边框样式
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Stack(
        children: [
          ///显示的内容主区域
          buildCataloguePositioned(bean, textColor),
          ///显示的右下角的页码
          buildPagePositioned(index),
        ],
      ),
    );
  }

  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///右下角的圆形页码
  Positioned buildPagePositioned(int index) {
    return Positioned(
      ///右下角对齐
      bottom: 8, right: 8,
      child: Container(
        ///容器大小
        width: 24, height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.indigoAccent[100],
            ///边框圆角
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Text("${index + 1}"),
      ),
    );
  }

  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///显示的内容主区域
  Positioned buildCataloguePositioned(CatalogBean bean, Color textColor) {
    return Positioned(
      left: 0, right: 0, top: 0, bottom: 0,
      child: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          ///包裹
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(bean.pageTitle,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
            Divider(),
            Expanded(
              child: Text(bean.pageMessage,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("目录"),
      ),
      body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              ///翻书效果
              buildReadBookPositioned(context),
              ///抽屉视图
              buildDragWidget(),
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///每一页对应的Widget
  List<Widget> widgetList = [];
  ///翻书效果
  Positioned buildReadBookPositioned(BuildContext context) {
    return Positioned(
      top: 22,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: widgetList.length == 0
            ? Container()
            : ReadBookPage(
                ///翻书的时间长
                loopDuration: Duration(milliseconds: 5000),
                ///翻书的下一页的间隔时长
                intervalDuration: Duration(milliseconds: 1000),
                ///翻书的内容Widget
                list: widgetList,
                ///每当翻页时的回调
                onChangeCallBack: (value) {
                  LogUtil.e(" onChangeCallBack 回调 $value");
                },
                ///点击当前页的回调
                onClickCallBack: (int value) {
                  LogUtil.e("onClickCallBack 回调 $value");
                  ///获取对应的数据
                  CatalogBean catalogBean = list[value + 1];
                  ///打开对应的页面
                  NavigatorUtils.openPageByFade(context, catalogBean.page,
                      dismissCallBack: (value) {});
                },
              ),
      ),
    );
  }





  ///构建底部对齐的抽屉效果视图
  Widget buildDragWidget() {
    ///层叠布局中的底部对齐
    return Align(
      alignment: Alignment.bottomCenter,
      child: DragContainer(
        ///抽屉关闭时的高度 默认0.4
        initChildRate: 0.4,

        ///抽屉打开时的高度 默认0.4
        maxChildRate: 0.6,

        ///是否显示默认的标题
        isShowHeader: true,

        ///背景颜色
        backGroundColor: Colors.white,

        ///背景圆角大小
        cornerRadius: 12,

        ///自动上滑动或者是下滑的分界值
        maxOffsetDistance: 1.5,

        ///抽屉控制器
        controller: dragController,

        ///自动滑动的时间
        duration: Duration(milliseconds: 800),

        ///抽屉的子Widget
        dragWidget: CatalogueDragPage(list),

        ///抽屉标题点击事件回调
        dragCallBack: (isOpen) {},
      ),
    );
  }
}
