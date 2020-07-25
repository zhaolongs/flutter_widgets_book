import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/common/sp_key.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
import 'package:flutterbookcode/utils/code1/sp_utils.dart';
import 'package:flutterbookcode/utils/date_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';

import 'config/theme_notifier.dart';
import 'page/home/home_main_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/20.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class SplashPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

//lib/code/main_data.dart
class _IndexPageState extends State<SplashPage> {
  List<String> splList = [
    "assets/images/3.0x/sp01.png",
    "assets/images/3.0x/sp02.png",
    "assets/images/3.0x/sp05.png",
    "assets/images/3.0x/sp03.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: buildStack(),
      ),
    );
  }

  buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildPageView(),
        buildTopDate(),
        buildBottomButton(),
      ],
    );
  }

  buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        LogUtil.e("pageView on changed $value");
        buildTopText(value);
      },
      itemCount: splList.length,
      itemBuilder: (BuildContext context, int postion) {
        return Image.asset(
          splList[postion],
          fit: BoxFit.fill,
        );
      },
    );
  }

  buildTopDate() {
    return Positioned(
      top: 40,
      right: 20,
      child: AnimatedContainer(
        alignment: Alignment.center,
        onEnd: () {
          if (topWidth == 130) {
            isShowWeek = true;
          } else {
            isShowWeek = false;
          }
          setState(() {});
        },
        width: topWidth,
        height: topHeight,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(topRadius)),
            border: Border.all(
              width: 3,
              color: golbalCurrentTheme(context).textTheme.headline1.color,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text1,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: golbalCurrentTheme(context).textTheme.headline1,
            ),
            isShowWeek
                ? Text(
                    text2,
                    style: golbalCurrentTheme(context).textTheme.headline1,
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  buildBottomButton() {
    if (isShowWeek) {
      return Positioned(
        bottom: 40,
        left: 20,
        child: InkWell(
          onTap: () {
            ///保存标识
            SPUtil.save(spUserIsFirstKey, true);
            ///跳转首页
            NavigatorUtils.openPageByFade(context, HomeMainPage(),isReplace: true);
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  width: 3,
                  color: golbalCurrentTheme(context).textTheme.headline1.color,
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringLanguages.of(context).get(StringKey.buttonGoHome),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: golbalCurrentTheme(context).textTheme.headline2,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  String text1 = "1";
  String text2 = "";
  double topWidth = 40;
  double topHeight = 40;
  double topRadius = 20;
  bool isShowWeek = false;

  buildTopText(int value) {
    if (value < splList.length - 1) {
      text1 = "${value + 1}";
      text2 = "";
      topWidth = 40;
      topHeight = 40;
      topRadius = 20;
      isShowWeek = false;
    } else {
      text1 = "${DateUtils.getNowDateStr()}";
      text2 = "${DateUtils.getNowWeekDay()}";
      topWidth = 130;
      topHeight = 80;
      topRadius = 2;
    }
    setState(() {});
  }
}
