import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/common/sp_key.dart';
import 'package:flutterbookcode/utils/code1/sp_utils.dart';
import 'package:provider/provider.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

golbalCurrentTheme(BuildContext context) {
  return Provider.of<ThemeModel>(context, listen: false)
      .getCurrentThemeData();
}
//ChangeNotifier 消息监听者与notifyListeners()结合实现消息通信 
//类似iOS中的notify与Android中的广播 
class ThemeModel extends ChangeNotifier {
  ///亮色主题
  ///应用程序默认的主题
  final ThemeData lightTheme = ThemeData(brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Color(0xffeeeeee),
      appBarTheme: AppBarTheme(elevation: 1.0,brightness: Brightness.dark, color: Color(0xff212f38),),


      ///底部弹框的样式
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color(0x99999999), elevation: 1.0
      ));

  ///暗色主题
  final ThemeData dartTheme = ThemeData(brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xff212f38),
      appBarTheme: AppBarTheme(elevation: 1.0),

      ///底部弹框的样式
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color(0x50999999)
      ));
  final ThemeData grayTheme = ThemeData(primaryColor: Colors.grey,
      ///底部弹框的样式
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color(0x50999999)
      ));

  ThemeData currentThemeData;

  ///获取当前的主题色
  ThemeData getCurrentThemeData() {
    if (currentThemeData == null) {
      currentThemeData = lightTheme;
    }
    return currentThemeData;
  }

  ///主题切换
  void setThem(num index) {
    switch (index) {
      case 0:
        currentThemeData = dartTheme;
        break;
      case 1:
        currentThemeData = lightTheme;
        break;
      case 2:
        currentThemeData = grayTheme;
        break;
      default :
        currentThemeData = lightTheme;
        break;
    }

    if(index==null){
      return;
    }
    ///使用 notifyListeners() 函数通知监听者以更新界面。
    notifyListeners();
    ///保存主题
    SPUtil.save(spUserThemeKey, index);
  }
}
