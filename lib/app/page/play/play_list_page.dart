import 'package:flutter/cupertino.dart'
    show
        BoxConstraints,
        BuildContext,
        Column,
        ConstrainedBox,
        State,
        StatefulWidget,
        Text,
        Widget;
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_video.dart';
import 'package:flutterbookcode/app/page/home/find_video_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class PlayListPage extends StatefulWidget {
  final List<VideoModel> list;
  final int initIndex;

  PlayListPage({this.list, this.initIndex = 0});

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  List<VideoModel> list;
  int initIndex;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.list != null) {
      list = widget.list;
    } else {
      list = [];
    }
    initIndex = widget.initIndex;
    _pageController= new PageController(initialPage: initIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      ///页面主体内容
      body: RefreshIndicator(
        ///可滚动组件在滚动时会发送ScrollNotification类型的通知
        ///RefreshIndicator会接收到NestedScrollView里面不同的滚动Widget发来的
        ///[ScrollNotification]消息通知
        notificationPredicate: (ScrollNotification notifation) {
          ///该属性包含当前ViewPort及滚动位置等信息
          ///pixels：当前滚动位置。
          ///maxScrollExtent：最大可滚动长度。
          ///extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
          ///extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
          ///extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
          ///atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）
          ScrollMetrics scrollMetrics = notifation.metrics;
          if (scrollMetrics.minScrollExtent == 0) {
            return true;
          } else {
            return false;
          }
        },

        ///下拉刷新回调方法
        onRefresh: () async {
          ///模拟网络刷新 等待2秒
          await Future.delayed(Duration(milliseconds: 2000));

          ///返回值以结束刷新
          return Future.value(true);
        },

        ///页面的主体内容
        ///是一个 NestedScrollView
        child: PageView.builder(
            controller: _pageController,
            /// pageview中 子条目的个数
            itemCount: list.length,

            /// 上下滑动
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              VideoModel videoModel = list[index];
              return FindVideoItemPage(
                videoModel: videoModel,
              );
            }),
      ),
    );
  }

}
