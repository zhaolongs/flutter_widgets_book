
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

///声明全局变量
String testName = "王五";

class Test{
  ///类变量
  final name = '张三';
  //final 的值要到运行时才确定
  static final name2 = '张三';
  //const 的值在编译期确定
  static const age2= 22;

  //私有类变量 只可本类中访问
  final String _name3 ="test";

  void test(){
    ///局部变量
    String name ="测试";
  }

  ///
  ///参数 name 可选
  void test1([String name]){

  }
  void test2({String name}){

  }
  void test3({String name}) => print("arrow function");

  void test4(){
    // 根据一个Map创建一个新的Map, 插入顺序进行排列
    // 在这里通过泛型指定 了 Map中的key的类型为 String类型 value是动态的
    Map<String, dynamic> dic1 = new Map.from({'name': '张三'});
    print(dic1);  // {name: 张三}

    //修改name的值
    dic1['name'] = '李四';
    //向Map中添加新的键值对数据
    dic1['age'] = 23;

    ///遍历Map中所有的数据
    dic1.forEach((key, value) {
      print("${key} is ${value}");
    });

    // 创建非固定长度的Lsit
    var testList = List();
    ///方式一 遍历获取List中的所有数据
    testList.forEach((value) {
      //value 就是List中对应的值
    });
    ///方式二 遍历获取List中的所有的数据
    for(int i=0;i<testList.length;i++){
      ///根据索引获取List中的数据
      var value = testList[i];
    }

    //方式三
    //while+iterator迭代器遍历，类似Java中的iteator
    while(testList.iterator.moveNext()) {
      //获取对应的值
      var value = testList.iterator.current;

    }
     //方式四 增强for循环
    //for-in遍历
    for (var value in testList) {
      //value 就是List中对应的值
    }
  }

  void main() {
// 获取绘制图层
    OffsetLayer rootLayer = new OffsetLayer();
    PictureLayer pictureLayer = PictureLayer(Rect.zero);
    rootLayer.append(pictureLayer);
// 绘制图形
//    pictureLayer.picture =
//        createSolidRectanglePicture(Color(0xFFFF0000), 300, 200);
    rootLayer.updateSubtreeNeedsAddToScene();
    SceneBuilder sceneBuilder = SceneBuilder();
    rootLayer.addToScene(sceneBuilder);
    Scene scene = sceneBuilder.build();
    window.onDrawFrame = () {
      // 将绘制的图层输送到GPU
      window.render(scene);
    };
    window.scheduleFrame();
  }

  Widget buildColumnWidget(){
    return Column(children: [
      Text("张三"),
      Text("李四"),
    ],);
  }
}


