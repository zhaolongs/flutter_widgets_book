import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_video.dart';
import 'package:flutterbookcode/app/page/play/play_list_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/6/28.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class MineItemPage extends StatefulWidget {
  final int pageIndex;

  MineItemPage(this.pageIndex);

  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<MineItemPage>
    with AutomaticKeepAliveClientMixin {
  List<VideoModel> videoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///创建模拟数据

    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "推荐测试数据$i";
      videoModel.pariseCount = i * 22;
      if (i % 3 == 0) {
        videoModel.isAttention = true;
        videoModel.isLike = true;
      } else {
        videoModel.isAttention = false;
        videoModel.isLike = false;
      }
      videoModel.videoImag = "assets/images/2.0x/video_ placeholder.webp";
      videoModel.videoUrl = "http://pic.studyyoun.com/1583058399368141.mp4";

      videoList.add(videoModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildSliverGrid();
  }

  ///九宫格 通过构造函数来创建
  Padding buildSliverGrid() {
    ///结合 SliverPadding 设置一个内边距
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView.builder(
          padding: EdgeInsets.all(1.0),
          cacheExtent: 0,
          itemCount: videoList.length,
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 1.0,
              //横轴间距
              crossAxisSpacing: 1.0,
              //子组件宽高长度比例
              childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            VideoModel videoModel = videoList[index];
            return OpenContainer(
              transitionDuration: Duration(milliseconds: 800),
              closedBuilder: (BuildContext context, void Function() action) {
                return Container(
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Image.asset(
                        videoModel.videoImag,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            size: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text("33"),
                        ],
                      ),
                    )
                  ]),
                );
              },
              openBuilder: (BuildContext context,
                  void Function({Object returnValue}) action) {
                return PlayListPage(
                  list: videoList,
                  initIndex: index,
                );
              },
            );
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
