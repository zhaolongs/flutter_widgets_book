
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///4.1
///AppBar的基本使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//4.2.1  /lib/code3/main_data44-1.dart
// TabBar的样式分析说明
///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),
          theme: ThemeData(
            indicatorColor: Colors.yellow,
            tabBarTheme: TabBarTheme(
              //配置选中的标签的背景样式
              indicator:BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20)
              ) ,
              //指示线的模式
              indicatorSize: TabBarIndicatorSize.label,
              //Tab中显示内边距
              labelPadding: EdgeInsets.only(left: 20, right: 20),
              //Tab中选中时显示的文字颜色
              labelColor: Colors.white,
              //选中时使用的文字样式
              labelStyle: TextStyle(
                //文字大小
                  fontSize: 15.0,
                  //文字加粗
                  fontWeight: FontWeight.w500
              ),
              ///Tab选中时Tab的颜色
              unselectedLabelColor: Color(0xffffffff),
              ///Tab未选中时的文字颜色
              unselectedLabelStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400
              ),
            )
          ),),);

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}

class FirstPagetate extends State<FirstPage>
    with SingleTickerProviderStateMixin {

  //控制器
  TabController _tabController;
  //Tab集合
  List<Tab> tabs = <Tab>[];
  ///对应的页面集合
  List<ItemPage> bodyPageList = [];

  @override
  void initState() {
    super.initState();
    //初始化Tab
    tabs = <Tab>[

      Tab(text: "Tab0",),
      Tab(text: "Tab1",),
      Tab(text: "Tab2",),
      Tab(text: "Tab3",),
      Tab(text: "Tab4",),
    ];
    ///根据Tab的数量来创建页面
    for(int i=0;i<tabs.length;i++){
      Tab tab = tabs[i];
      ItemPage itemPage = new ItemPage(tab.text, i);
      bodyPageList.add(itemPage);
    }

    //initialIndex初始选中第几个
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(
        ///配置TabBar
        title: buildAppBarTitle(),
        ///标题居中
        centerTitle: true,),
      ///页面的主内容区
      body: buildBodyFunction(),);
  }

  //4.2.1  /lib/code3/main_data44-1.dart
  // TabBar的样式分析说明
  TabBar buildAppBarTitle() {
    //TabBar，它可以使子Widget在水平方向线性排列
    return TabBar(
      //可以和TabBarView关联使用同一个TabController
      controller: _tabController,
      //子Tab
      tabs: tabs,
      //是否可滑动
      isScrollable: true,
      //指示器的宽度
      indicatorWeight: 1,
    );
  }

  ///4.1.4 /lib/code3/main_data43-3.dart
  ///Row标签结合TabBarView实现滑动切换
  ///封装方法构建PageView组件
  TabBarView buildBodyFunction() {
    ///可实现左右页面滑动切换
    return TabBarView(
      //控制器
      controller: _tabController,
      //滑动到页面底部无回弹效果
      physics: BouncingScrollPhysics(),
      //所有的子Widget
      children: bodyPageList,
    );
  }


}

class ItemPage extends StatefulWidget {
  String title;
  int index;

  ItemPage(this.title, this.index);

  @override
  State<StatefulWidget> createState() {
    return ItemPageState();
  }
}

class ItemPageState extends State<ItemPage> {

  @override
  void initState() {
    super.initState();

    print("页面初始化 ${widget.title} - ${widget.index}");
  }
  @override
  void dispose() {
    super.dispose();
    print("页面销毁 ${widget.title} - ${widget.index}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //页面背景颜色
      backgroundColor: widget.index % 2 == 0 ? Colors.grey : Colors.white,
      body: Center(child: Text("${widget.title}  ${widget.index}"),),);
  }
}
