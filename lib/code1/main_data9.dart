

//2.6.4 /lib/code1/main_data9.dart
import 'package:flutter/material.dart';


//2.6.1 lib/code1/main_data5.dart
//自定义路由观察者
import 'package:flutter/cupertino.dart';




void main() => runApp(RoutesApp());
//定义根目录Widget
class RoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //路由配置404
    return
      MaterialApp(
        //配制路由规则
        routes: {
          //默认页面
          "/": (BuildContext context) => FirstPage(),
          "/first": (BuildContext context) => FirstPage(),
          "/scend": (BuildContext context) => ScendPage(),
        },

        //配制404 页面
        onGenerateRoute: (RouteSettings settings) {
          return new MaterialPageRoute(
              builder: (BuildContext contex) => ErrorPage());
        },
        //兼听所有的页面路由
        navigatorObservers: <NavigatorObserver>[
          //创建自定义路由兼听
          MyNavigatorObservers(),
        ],

      );
  }
}


//2.6.3 lib/code1/main_data5.dart
//NavigatorObservers实战
//页面FirstPage
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Column(children: <Widget>[
        FlatButton(
          child: Text("透明的方式"),
          onPressed: (){
open1(context);
          },
        ),
        FlatButton(
          child: Text("旋转的方式"),
          onPressed: (){
            open2(context);

          },
        ),
        FlatButton(
          child: Text("缩放的方式"),
          onPressed: (){

            open4(context);

          },
        ),
        FlatButton(
          child: Text("平移的方式"),
          onPressed: (){

            open5(context);

          },
        ),
        FlatButton(
          child: Text("组合的方式"),
          onPressed: (){

            open6(context);

          },
        ),
      ],),
    );
  }

  void open1(BuildContext context){
    //自定义动态路由实战 以透明的方式打开ScendPaged页面
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      //目标页面
      return new ScendPage();
    }, transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) {
      //渐变过渡动画
      return FadeTransition(
        // 透明度从 0.0-1.0
        opacity: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            //动画曲线规则，这里使用的是先快后慢
            curve: Curves.fastOutSlowIn,
          ),),
        child: child,
      );
    }));
  }

  void open2(BuildContext context){
  //自定义动态路由实战 以旋转的方式打开ScendPaged页面
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      //目标页面
      return new ScendPage();
    }, transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) {
      //旋转
      return RotationTransition(
        //设置动画的旋转中心
        alignment: Alignment.center,
        //旋转角度
        turns: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            //动画样式
            parent: animation,
            //动画曲线 先抖动再旋转
            curve: Curves.bounceIn,
          ),),
        child: child,
      );
    }));
  }
  void open4(BuildContext context){
    //自定义动态路由实战 以缩放的方式打开ScendPaged页面
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      //目标页面
      return new ScendPage();
    }, transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) {
      //缩放
      return ScaleTransition(
        alignment: Alignment.centerRight, //缩放中心
        scale: Tween(begin:  0.0, end: 1.0).animate(  // 从 0.0-1.0
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,//动画曲线
          ),),
        child: child,
      );
    }));
  }
  void open5(BuildContext context){
    //自定义动态路由实战 以平移的方式打开ScendPaged页面
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      //目标页面
      return new ScendPage();
    }, transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) {
      //平移
      return SlideTransition(
        // 从位置(-1.0, 0.0) 平移到 (0.0, 0.0)
        position: Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),),
        child: child,
      );
    }));
  }
  void open6(BuildContext context){
    //自定义动态路由实战 以组合的方式打开ScendPaged页面
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      //目标页面
      return new ScendPage();
    }, transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) {
      //组合
      return SlideTransition(
        // 从位置(-1.0, 0.0) 平移到 (0.0, 0.0)
        position: Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: FadeTransition(
          // 透明度从 0.0-1.0
          opacity: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
      );
    }));
  }
}

//页面ScendPage
//跳转到第二个页面ScendPage中，在ScendPage中获取上一个页面参数
class ScendPage extends StatefulWidget {
  @override
  ScendPageState createState() => ScendPageState();
}

class ScendPageState extends State<ScendPage> {
  //页面创建时执行的第一个方法
  @override
  void initState() {super.initState();}
  //页面创建执行的第二个方法
  //页面 State、Context已绑定
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

///错误页面
class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '出错了',
              style: TextStyle(color: Colors.red),
            ),

          ],
        ),
      ),

    );
  }
}

//2.6.3 lib/code1/main_data5.dart
//NavigatorObservers实战
//创建自定义路由观察者MyNavigatorObservers
class MyNavigatorObservers extends NavigatorObserver {
  // 当调用Navigator.push时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print("didPush目标的路由名称是 " + route.settings.name.toString());
    //print("didPush目标的路由是否是InitialRoute配置的初始化路由 " + route.settings.isInitialRoute.toString());
    print("didPush目标的路由携带的参数 " + route.settings.arguments.toString());
    if (previousRoute != null) {
      print("上一个路由的名称是 " + previousRoute.settings.name.toString());
    }else{
      //当为第一个初始化页面时 previousRoute是为null的
    }
  }
  // 当调用Navigator.pop时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print("didPop 目标的路由名称是 " + route.settings.name.toString());
    //print("didPop 目标的路由是否是InitialRoute配置的初始化路由 " + route.settings.isInitialRoute.toString());
    print("didPop 目标的路由携带的参数 " + route.settings.arguments.toString());
    if (previousRoute != null) {
      print("didPop 上一个路由的名称是 " + previousRoute.settings.name.toString());
    }else{
      //当为第一个初始化页面时 previousRoute是为null的
    }
  }
  // 当调用Navigator.Remove时回调
  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }
}



