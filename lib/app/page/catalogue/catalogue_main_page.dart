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
        "第4章AppBar组件", MainAppBarPage(), "Row 在 AppBar中实现的标签栏切换效果"),
    new CatalogBean("第5章文本Text组件", TextMainPage(), "5.1 文本显示组件的基本使用 5.2 样式组件TEXTSTYLE的使用分析  25.2.2 样式组件TEXTSTYLE的INHERIT 35.2.3 样式组件TEXTSTYLE的颜色配置  45.2.4 文字大小FONTSIZE  45.2.5 文字粗细设置FONTWEIGHT  65.2.6 文字斜体设置  75.2.7 文字间距设置  75.2.8 文字基线TEXTBASELINE分析  85.2.9 装饰DECORATION分析  95.2.10 自定义字体FONTFAMILY配置  135.2.11 字体列表FONTFAMILYFALLBACK配置 155.2.11 字体阴影SHADOWS配置  165.2.13 文本高度HEIGHT配置 175.3 TEXT中文字对齐方式 195.3.1 文字超出宽度显示省略号 245.3.2 文字自动换行设置  265.3.3 弹性布局综述  295.4 富文本RICHTEXT组件的使用分析  315.6 富文本RICHTEXT使用案例 345.7 文本标签  365.7.1 文本标签构建  365.7.2 文本标签结合流式布局使用  395.8 ANIMATEDDEFAULTTEXTSTYLE的使用分析 "),
    new CatalogBean("第6章输入框Textfield", TextFieldMainPage(),
        "6.1.1 输入的文字不可见  6.1.2 配置输入的英文首字母大写  6.1.3 配置弹出的键盘类型 6.1.4键盘回车键的样式与功能  6.1.5键盘回车键切换输入框 6.1.6 FOCUSNODE输入框焦点事件的捕捉与监听  6.1.7 TEXTFIELD 输入文本对齐配置 6.2 TEXTFIELD组件的设置允许输入的文本格式 6.2.1输入字数限制  6.2.2输入行数限制 6.2.3只允许输入数字  6.2.4只允许输入26个A-Z大小写字母  6.2.5自定义TEXTINPUTFORMATTER   6.3 TEXTFIELD组件INPUTDECORATION   6.3.1 TEXTFIELD组件去掉默认的下划线 6.3.2 TEXTFIELD边框装饰OUTLINEINPUTBORDER 6.3.3 TEXTFIELD边框装饰线的颜色配置 6.3.4 TEXTFIELD不可编辑 6.4 TEXTFIELD组件配置提示文本 6.4.1 TEXTFIELD的LABELTEXT使用 6.4.2 TEXTFIELD的PREICON使用 6.4.3 TEXTFIELD的COUNTTEXT使用 6.4.4 TEXTFIELD的HELPERTEXT与ERRORTEXT   6.5 TEXTFIELD组件控制器TEXTEDITINGCONTROLLER 6.6 TEXTFIELD组件光标样式配置  6.7 一个搜索框  6.7.1 搜索框SEARCHSTATICBAR组件构建  6.7.2 搜索输入框SEARCHTEXTFIELDBAR组件构建  6.7.3 搜索输入框使用案例 54"),

    new CatalogBean(
        "第7章容器Container", ContainerMainPage(), "7.1 CONTAINER组件的基本使用 7.1.1 CONTRAINER的大小限定分析 7.1.2 CONTRAINER自适应包裹子WIDGET  7.2 CONTAINER组件的内外边距 7.2.1 EDGEINSETS分析  7.2.2 PADDING分析 7.2.3 CONTAINER在LISTVIEW中ITEM中的自适应包裹 7.3 CONTAINER组件DECORATION应用 7.3.1 BOXDECORATION在CONTAINER中的应用分析 7.3.2 BOXDECORATION在CONTAINER中的配置阴影7.3.3 BOXDECORATION在CONTAINER中的配置渐变过渡样式 7.3.4 BOXDECORATION配置背景图像 7.3.5 BOXDECORATION的SHAPE属性配置使用 7.3.6 SHAPEDECORATION在CONTAINER中的使用分析 7.4 自定义SHAPEBORDER  7.4.1 打洞效果  7.4.2手撕优惠券的效果  ANIMATEDCONTAINER的基本使用   CONSTRAINEDBOX组件的使用分析 "),

    new CatalogBean("第8章按钮Button", ButtonMainPage(), "8.1 MATERIALBUTTON的使用分析 8.1.1 BUTTONTHEMEDATA的使用分析 8.1.2 各种COLOR的使用分析  8.1.3 MATERIALBUTTON的回调函数说明 8.1.4 MATERIALBUTTON的SHAPE使用分析 8.1.5 MATERIALBUTTON的宽高分析8.1.6 MATERIALBUTTON的子WIDGET分析 8.1.6 MATERIALBUTTON的内边距分析 8.1.7 RAISEDBUTTON的使用分析 8.1.8 FLATBUTTON的使用分析 8.1.9 OUTLINEBUTTON的使用分析  8.2 FLOATINGACTIONBUTTON  8.2.1 属性MINI分析  8.2.2 属性SHAPE分析 8.2.3标签样式 8.2.4 与SCALFOLD的底部BOTTOMNAVIGATIONBAR综合使用 8.2.5 两个页面的过渡动画 8.2.6 悬浮按钮的旋转变换 8.2.7 悬浮按钮实现向上弹出的菜单效果 8.2.8 带有加载进度的PROGRESSBUTTON按钮使用 8.3 ICONBUTTON系列  8.3.1 POPUPMENUBUTTON按钮的使用  8.3.2 实现类似微信首页右上角的小弹框 8.4 自定义动画效果按钮ANIMATEDBUTTON 8.5 自定义进度交互的动画按钮  8.5.2 实现背景填充效果的按钮 8.5.3 ANIMATEDSTATUSBUTTON的自定义分析 "),
    new CatalogBean("第9章UI布局", UilayoutWidgetMainPage(), "9.1 线性布局COLUMN  9.1.1 COLUMN中子WIDGET的对齐方式分析 9.1.2 COLUMN中子WIDGET按比例分布 9.1.3 COLUMN的宽与高自适应 9.2线性布局ROW  9.2.1 ROW中子WIDGET的对齐方式分析 9.2.2 ROW中子WIDGET按比例分布  19.3弹性布局FLEX 9.3.1 FLEXIBLE和 EXPANDED的区别 9.4流式布局WRAP 9.5 基于WRAP实现的TAG标签使用  9.5 流式布局FLOW  9.5.1 初探FLOWDELEGATE  9.5.2 圆形动态弹出菜单  9.5.3 类似开源中国的圆形动态菜单 9.5.4 向上弹出的动态菜单 、9.6层叠布局STACK  9.6.1 POSITIONED分析 9.6.2 STACK中使用ALIGN"),
    new CatalogBean(
        "第10章图片Image组件", ImageMainPage(), "10.2加载不同分辨率资源图片10.3 ANDROID与IOS中屏幕分辨率简析 10.3.1分辨率（PX） 10.3.2 屏幕尺寸大小(IN) 10.3.3 屏幕密度（PPI） 10.3.4 ANDROID中的屏幕密度(DIP与DP)  10.3.6 DIP与PPI的区别 10.3.7 RPX  10.3.8 VW、VH  10.3.9 ANDROID中的图片加载  10.3.10 IOS中的图片加载 10.3.11 FLUTTER程序最终加载图片 10.3.12 FLUTTER中获取屏幕相关信息 10.3.13 ASSET静态方法参数分析使用10.4 通过IMAGE组件加图片 10.4.1 通过FILEIMAGE加载手机存储目录下的图片 10.4.2 ANDROID与IOS平台下的存储目录分析 10.4.3 获取手机的存储目录空间路径 10.4.4 清除数据和清除缓存的区别 10.5 通过FADEINIMAGE组件加图片 10.6 通过DECORATIONIMAGE组件加图片10.7 IMAGE.NETWORK的使用 10.8 加载圆形图片 10.9 RAWIMAGE的使用分析 10.10高斯模糊 10.11将WIDGET保存为图片 10.12图片添加水印 10.13. 缩放图片、拖动图片  10.13. 为图片添加水波纹点击事件 "),
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
