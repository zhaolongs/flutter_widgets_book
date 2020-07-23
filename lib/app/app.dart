import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fai_umeng/flutter_fai_umeng.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbookcode/demo/shake/shake_animation_text.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
import 'package:flutterbookcode/utils/code1/sp_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';
import 'package:provider/provider.dart';

import 'common/sp_key.dart';
import 'config/cupertino_delegate.dart';
import 'config/language_config.dart';
import 'config/local_model.dart';
import 'config/theme_model.dart';
import 'index.dart';
import 'splash.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/20.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class RootApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RottAppState();
  }
}

class _RottAppState extends State<RootApp> {

  ///用户的国际化配置
  Locale _userLocale;


   ///Provider的三个好兄弟：老大 -- MultiProvider  供货商
   ///老二 -- Providers   货源
   ///老三 -- Provider.of<T>(context)  /  Widget Consumer 消费者
  @override
  Widget build(BuildContext context) {
    ///供货商
    return MultiProvider(
      ///构建子Widget
      child: buildMaterialApp(),
      ///货源
      providers: [
        //在这里可配置多个数据模型的Provider
        //将Provider配制在程序的最顶层
        //随着某些数据改变而被通知更新
        ///provider不需要被监听，有的常量或者方法，根本不需要“牵一发而动全身”，也就是说他们不会被要求随着变动而变动
        /// ChangeNotifierProvider 它会随着某些数据改变而被通知更新 比如这个Model被用在多个page，那么当其中一处被改变时，他就应该告诉其他的地方，改更新了
        ///  ChangeNotifierProxyProvider  比如一个ModelA依赖另一个ModelB，ModelB更新，他就要让依赖它的ModelA也随之更新
        ChangeNotifierProvider<ThemeModel>.value(
          //value就是监听的数据模型对象
          value: ThemeModel(),
          //这里最好是根widget
        ),
        ChangeNotifierProvider<LocaleState>.value(
          //value就是监听的数据模型对象
          value: LocaleState.zh(),
          //这里最好是根widget
        ),
        //在这里还可以配置其他的ChangeNotifierProvider

      ],);
  }

  buildMaterialApp() {
    return Consumer2<ThemeModel, LocaleState>(
      builder: (BuildContext context, ThemeModel value, LocaleState localeState,
          Widget child) {
        _userLocale = localeState.locale;
        LogUtil.e("根目录 修改语言环境 $_userLocale");
        return ColorFiltered(
          colorFilter: ColorFilter.mode(value.getCurrentThemeData().primaryColor==Colors.grey?Colors.grey:Colors.transparent, BlendMode.color),
          child: MaterialApp(
            theme: value.getCurrentThemeData(),
            ///应用程序默认显示的页面
            home: IndexPage(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [

              ///初始化默认的 Material 组件本地化
              GlobalMaterialLocalizations.delegate,

              ///初始化默认的 通用 Widget 组件本地化
              GlobalWidgetsLocalizations.delegate,

              ///自定义的语言配制文件代理 初始化
              MyLocationsLanguageDelegates.delegate,

              ///支持使用 CupertinoAlertDialog 的代理
              FallbackCupertinoLocalisationsDelegate.delegate,
            ],

            ///当前区域，如果为null则使用系统区域一般用于语言切换
            ///传入两个参数，语言代码，国家代码
            ///这里配制为中国
            localeResolutionCallback:
                (Locale sysLocale, Iterable<Locale> supportedLocales) {
              ///locale 反回当前系统的语言环境
              ///supportedLocales 返回 supportedLocales 中配制的语言环境支持的配置
              ///判断应用程序是否支持当前系统语言
              List<String> locals = [];
              List<Locale> list = supportedLocales.toList();
              for (int i = 0; i < list.length; i++) {
                locals.add(list[i].languageCode);
              }

              ///如果当前系统的语言应用程序不支持
              ///那么在这里默认返回英文环境
              if (!locals.contains(sysLocale.languageCode)) {
                sysLocale = Locale('en', 'US');
              }
              _userLocale = sysLocale;
              return _userLocale;
            },

            ///配置程序语言环境
            locale: _userLocale,

            ///定义当前应用程序所支持的语言环境
            supportedLocales: [
              const Locale('en', 'US'), // English 英文
              const Locale('zh', 'CN'), // 中文，
            ],
          ),
        );
      },
    );
  }


  ///定义外部修改语言环境的方法 
  changeLocale(Locale locale) {
    setState(() {
      _userLocale = locale;
    });
  }


}
