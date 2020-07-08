import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

///lib/code16/refresh_listView.dart
/// ListView 的下拉刷新与上拉加载更多 分页加载 封装组件
 class RefreshListView extends StatefulWidget {
  ///滑动控制器
  final ScrollController scrollController;
  ///子条目的个数
  final int itemCount;
  ///子条目的构建器
  final Function(BuildContext context, int index) itemBuider;
  ///下拉刷新的回调
  final Function(int pageIndex, int pageSize) refreshCallback;
  ///上拉加载更多的回调
  final  Function(int pageIndex, int pageSize) loadMoreCallback;
  ///ListView条目构建回调函数 
  ///[firstIndex]当前页面显示的第一个条目的索引
  ///[lastIndex]当前页面显示的最后一个条目的索引
  final  Function(int firstIndex, int lastIndex) layoutCallBack;

  RefreshListView(
      {@required this.itemCount,
      @required this.itemBuider,
      this.scrollController,
      this.refreshCallback,
      this.loadMoreCallback,
      this.layoutCallBack});

  @override
  ScrollHomePageState createState() => ScrollHomePageState();
}



class ScrollHomePageState extends State<RefreshListView> {
  ///分页加载数据的页数
  int pageIndex = 1;
  ///分页加载数据每页的大小
  int pageSize = 20;
  ///列表滑动控制器
  ScrollController scrollController = new ScrollController();
  ///当前上拉加载的状态
  RefreshStatus currentRefreshStatus = RefreshStatus.loading;

  @override
  void initState() {
    super.initState();
    if(widget.scrollController!=null){
      scrollController = widget.scrollController;
    }

    if(widget.refreshCallback!=null){
     _loadMoreData(true);
    }
    ///为ListView添加滑动监听功能
    ///当列表滑动到页面底部时触发加载更多功能
    scrollController.addListener(() {
      ///获取滑动的距离
      double scrollOffset = scrollController.offset;
      ///当前不在加载中时再触发加载数据功能
      if (currentRefreshStatus != RefreshStatus.loading) {
        ///滑动到底部时触发加载更多
        if (scrollOffset >= scrollController.position.maxScrollExtent) {
          print("加载更多");
          pageIndex++;
          ///加载数据
          _loadMoreData(false);
        }
      }
    });
  }

  ///lib/code15/main_data1609.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildRefresh(),
    );
  }

  ///构建下拉刷新组件
  Widget buildRefresh() {
    return RefreshIndicator(
      ///下拉刷新回调方法
        onRefresh: () async {
            return _loadMoreData(true);
        },
        ///页面的列表
        child: buildListView());
  }

  ///lib/code15/main_data1609.dart
  ///通过custom来构建 列表 ListView
  ///通过custom来构建 列表 ListView
  Widget buildListView() {
    return ListView.custom(
      controller:scrollController,
      ///清除缓存区域
      cacheExtent: 1.0,
      ///自定义代理
      childrenDelegate: CustomRefreshBuilderDelegate(
              (BuildContext context, int index) {
            ///子Item单独封装成了一个StatefulWidget
            if (index < widget.itemCount) {
              ///正常显示的列表Item
              return widget.itemBuider(context,index);
            } else {
              ///如果是最后一个条目 构建加载更多的内容
              return buildFooterWidget();
            }
          },
          ///子条目个数
          childCount: widget.itemCount + 1,
          ///子条目绘制完成后的回调
          /// 当前页面显示的第一个条目的角标 firstIndex
          /// 当前页面显示的最后一个条目的角标lastIndex
          layoutCallBack: (int firstIndex, int lastIndex) {
            if(widget.layoutCallBack!=null){
              widget.layoutCallBack(firstIndex,lastIndex);
            }
          }),
    );
  }

  ///lib/code15/main_data1609.dart
  ///加载更多
  Future<bool> _loadMoreData(bool isRefresh) async {
    print("加载数据  isRefresh $isRefresh pageIndex $pageIndex");
    ///刷新页面标识
    setState(() {
      ///列表尾部显示加载中
      currentRefreshStatus = RefreshStatus.loading;
    });
    List list =[];
    if(isRefresh){
      if(widget.refreshCallback!=null){
        list = await widget.refreshCallback(pageIndex,pageSize);
      }
    }else{
      if(widget.loadMoreCallback!=null){
        list= await widget.loadMoreCallback(pageIndex,pageSize);
      }
    }
    ///加载完成后更新状态
    if(list==null){
      ///更新页面角标
      pageIndex--;
      ///数据加载错误
      currentRefreshStatus = RefreshStatus.loadMoreError;

    }else if(list.length==0){
      pageIndex--;
      ///无数据时显示暂无数据
      currentRefreshStatus = RefreshStatus.noData;
    }else if(list.length<pageSize){
      ///当前的列表数据大于一页时才显示加载更多
      currentRefreshStatus = RefreshStatus.none;
    }else{
      currentRefreshStatus = RefreshStatus.normal;
    }
    return true;
  }


  ///lib/code15/main_data1609.dart
  ///构建底部显示加载更多的样式
  Widget buildFooterWidget() {
    String title = "上拉加载更多";
    ///默认一个空的视图
    Widget loadingWidget = Container();
    ///根据不同的加载数据状态来构建不同的页面显示
    switch (currentRefreshStatus) {
      case RefreshStatus.normal:
        title = "上拉加载更多";
        loadingWidget = Icon(Icons.center_focus_weak);
        break;
      case RefreshStatus.loading:
        title = "加载中";
        loadingWidget = CircularProgressIndicator();
        break;
      case RefreshStatus.loadMoreNoData:
        title = "暂无更多数据";
        loadingWidget = Icon(Icons.do_not_disturb);
        break;
      case RefreshStatus.loadMoreError:
        title = "加载错误";
        loadingWidget = Icon(Icons.error);
        break;
      case RefreshStatus.none:
        loadingWidget = Container();
        title = "";
        break;
      case RefreshStatus.noData:
        loadingWidget = Icon(Icons.computer);
        title = "暂无数据 点击刷新";
        break;
    }

    return InkWell(
      onTap: () {
        ///当加载无数据时点击刷新
        ///当加载出错时 点击刷新
        ///加载的都是当前页的数据
        if (currentRefreshStatus == RefreshStatus.loadMoreNoData ||
            currentRefreshStatus == RefreshStatus.loadMoreError ||
            currentRefreshStatus == RefreshStatus.noData) {
          ///加载下一页数据
          pageIndex++;
          ///加载数据
          _loadMoreData(false);
        }
      },
      child: Container(
        height: 66,
        ///线性布局 左右排列
        ///居中
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ///图标显示
          Container(
              height: 22,
              width: 22,
              child: loadingWidget,
              margin: EdgeInsets.only(right: 12)),

          ///显示的加载文案
          Text(title),
        ]),
      ),
    );
  }
}

///List使用到的数据模型
///lib/code15/main_data1609.dart
class ListDataBean {
  String title;
  String subTitle;
  String imageUrl;
  String createTime;
}

///lib/code15/main_data1609.dart
///页面加载状态
enum RefreshStatus {
  none,

  ///不显示上拉加载更多
  normal,

  ///正常显示状态
  noData,

  ///暂无数据
  loading,

  ///上拉加载更多状态
  loadMoreNoData,

  ///上拉加载无数据状态
  loadMoreError,

  ///上拉加载出错状态
}

///lib/code15/main_data1609.dart
///自定义代理
class CustomRefreshBuilderDelegate extends SliverChildBuilderDelegate {
  ///ListView的条目加载完成后的回调
  Function(int firstIndex, int lastIndex) layoutCallBack;

  CustomRefreshBuilderDelegate(
      Widget Function(BuildContext, int) builder, {
        int childCount,
        bool addAutomaticKeepAlives = true,
        bool addRepaintBoundaries = true,
        this.layoutCallBack,
      }) : super(builder,
      childCount: childCount,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries);

  ///当条目绘制完成时回调此方法
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    if (layoutCallBack != null) {
      layoutCallBack(firstIndex, lastIndex);
    }
  }
}
