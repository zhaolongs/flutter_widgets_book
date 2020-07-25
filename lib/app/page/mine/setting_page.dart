import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/app/base/base_life_state.dart';
import 'package:flutterbookcode/app/config/theme_model.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
import 'package:flutterbookcode/utils/log_util.dart';
import 'package:provider/provider.dart';

import '../../config/local_model.dart';
import '../common/common_bottom_dialog.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class SettingPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends BaseLifeState<SettingPage>{
  List<String> menuList = [
    StringKey.languageSelect,
    StringKey.themeSelect,
  ];
  List<IconData> iconList = [
    Icons.language,
    Icons.table_chart,
  ];

  Map<String, List<String>> mapDataList;
  @override
  void initState() {

    super.initState();

    mapDataList = {
      "language": [
        StringKey.languageZn,
        StringKey.languageEn,
      ],
      "theme": [
        StringKey.themeDark,
        StringKey.themeLight,
        StringKey.themeGray,
      ],
    };

    Future.delayed(Duration(milliseconds: 3000),(){
//      showCommonAlertDialog(
////          contentMessag: "提示",
////          cancleText: StringLanguages.of(context).get(StringKey.buttonExit),
////          selectText:StringLanguages.of(context).get(StringKey.buttonConsent),
////          selectCallBack: () {
////
////          },
////          cancleCallBack: () {
////
////          }, context: context);
    showSimpleDialog();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringLanguages.of(context).get(StringKey.settingCenter)),
      ),
      ///填充布局
      body: Column(children: [
        Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: menuList.length,
            itemExtent: 50,
            itemBuilder: (BuildContext context, int index) {
              return buildItemWidget(context, index);
            },
          ),
        ),
      ]),
    );
  }



  Widget buildItemWidget(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          if (index == 0) {
            showCommonBottomWidget(context, mapDataList["language"], (value) {
              LogUtil.e("pop select $value");
              if (value == 0) {
                Provider.of<LocaleState>(context, listen: false)
                    .changeLocaleState(LocaleState.zh());
              } else {
                Provider.of<LocaleState>(context, listen: false)
                    .changeLocaleState(LocaleState.en());
              }
              setState(() {});
            });
          } else {
            showCommonBottomWidget(context, mapDataList["theme"], (value) {
              LogUtil.e("pop select $value");
              if (value == 0) {
                Provider.of<ThemeModel>(context, listen: false).setThem(0);
              } else if (value == 1)  {
                Provider.of<ThemeModel>(context, listen: false).setThem(1);
              }else {
              Provider.of<ThemeModel>(context, listen: false).setThem(2);
              }
              setState(() {});
            });
          }
        },
        child: Row(
          children: [
            Icon(iconList[index],size: 20,),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(StringLanguages.of(context).get(menuList[index]))),
            Icon(Icons.arrow_forward_ios,size: 20,),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
 void showSimpleDialog() {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('选项 1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('选项 2'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void onCreat() {
    super.onCreat();
    LogUtil.e("设置页面 onCreat");
  }
  @override
  void onStart() {
    super.onStart();
    LogUtil.e("设置页面 onStart");
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    super.onResumed();
    LogUtil.e("设置页面 onResumed");
  }
  @override
  void onPause() {
    // TODO: implement onPause
    super.onPause();
    LogUtil.e("设置页面 onPause");
  }
  @override
  void onStop() {
    super.onStop();
    LogUtil.e("设置页面 onStope");
  }

  @override
  void onWillDestory() {
    super.onWillDestory();
    LogUtil.e("设置页面 onWillDestory");
  }
  @override
  void onDestory() {
    LogUtil.e("设置页面 onDestory");
  }




}
