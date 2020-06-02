import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/image_utils.dart';
import 'package:path_provider/path_provider.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data9010.dart
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageCachePage extends StatefulWidget {
  @override
  _ImageFileUsePageState createState() => _ImageFileUsePageState();
}

//lib/code/main_data9010.dart
//保存网络图片与加载保存好的图片
class _ImageFileUsePageState extends State {
  
  ///网络图片地址
  String netImageUrl =
      "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";
  ///本地存储目录的图片名称
  String localPathPicName ="test_image";
  ///用来加载本地的文件图片
  File localImageFile;

  ///加载本地图片
  void loadingLocalImage() async{
    ///使用工具类加载本地缓存目录下的图片
    localImageFile = await ImageUtils.imageUtils.getImageFileByPath(localPathPicName);
    if (localImageFile != null) {
      setState(() {

      });
    }
  }
  //lib/code/main_data9010.dart
  void saveImage() {
    ///使用工具类将网络图片保存到手机本地缓存目录下
    ImageUtils.imageUtils.saveImageByUrl(netImageUrl,picName: localPathPicName,isEncode: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载缓存目录下的图片"),
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              RaisedButton(child: Text("保存图片"),onPressed: (){
                saveImage();
              },),
            
              RaisedButton(child: Text("加载图片"),onPressed: (){
                loadingLocalImage();
              },),
              SizedBox(height: 60,),
              ///构建显示本地缓存目录中的图片
              buildFileImage(),
            ],
          )),
    );
  }

  buildFileImage() {
    if(localImageFile==null){
      return Text("加载中");
    }
    return Image(image:FileImage(localImageFile),);
  }

}
