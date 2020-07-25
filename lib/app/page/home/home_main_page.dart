//3.3 /lib/code2/main_data35.dart
//bottomNavigationBar配制底部导航栏菜单
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/app/common/user_helper.dart';
import 'package:flutterbookcode/app/page/catalogue/catalogue_main_page.dart';
import 'package:flutterbookcode/app/page/mine/mine_login_page.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';

import '../mine/mine_main_page.dart';
import 'home_item_page.dart';

class HomeMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}

class FirstThemState extends State<HomeMainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
          Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark);
      SystemChrome.setEnabledSystemUIOverlays(
          [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });

  }

  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: buildBodyFunction(),
      //底部导航栏
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  //选中的标签
  int _tabIndex = 0;

  //底部导航栏使用到的图标
  List<Icon> normalIcon = [
    Icon(Icons.home),
    Icon(Icons.message),
    Icon(Icons.people)
  ];

  //底部导航栏使用到的标题文字
  List<String> normalTitle = [
    StringKey.homeBottonTitle1,
    StringKey.homeBottonTitle2,
    StringKey.homeBottonTitle3,
  ];

  PageController _pageController = PageController();

  Widget buildBodyFunction() {
    //帧布局结合透明布局
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (value) {
        setState(() {
          _tabIndex = value;
        });
      },
      controller: _pageController,
      children: <Widget>[
        HomeItemMainPage(),
        CatalogueMainPage(),
        MineMainPage(),
      ],
    );
  }

  //构建底部导航栏
  BottomNavigationBar buildBottomNavigation() {
    //创建一个 BottomNavigationBar
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: normalIcon[0], title: Text(StringLanguages.of(context).get(normalTitle[0]))),
        new BottomNavigationBarItem(
            icon: normalIcon[1], title: Text(StringLanguages.of(context).get(normalTitle[1]))),
        new BottomNavigationBarItem(
            icon: normalIcon[2], title: Text(StringLanguages.of(context).get(normalTitle[2]))),
      ],
      //显示效果
      type: BottomNavigationBarType.fixed,
      //当前选中的页面
      currentIndex: _tabIndex,
      //图标的大小
      iconSize: 24.0,
      //点击事件
      onTap: (index) {
//        if(index==2){
//          if(UserHelper.getInstance.userBean==null){
//            openLoginPage(context);
//            return;
//          }
//        }
        _pageController.jumpToPage(index);
        _tabIndex = index;
      },
    );
  }
}

//bottomNavigationBar结合独立的StatefulWidget使用 首页面
class ScffoldHomeItemPage extends StatefulWidget {
  //页面标识
  int pageIndex;

  //构造函数
  ScffoldHomeItemPage(this.pageIndex, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState();
  }
}

class ScffoldHomeItemState extends State<ScffoldHomeItemPage> {
  //页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  //页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}
