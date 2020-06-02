

//lib/utils/image_loader_utils.dart.dart
//通过ImageProvider读取Image
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';


class ImageLoaderUtils {
  //私有化构造
  ImageLoaderUtils._();
  //单例模式创建
  static final ImageLoaderUtils imageLoader = ImageLoaderUtils._(); 

  //通过 文件读取Image
  //[path]文件的本地磁盘路径
  //[width][height]图片文件的宽高
  Future<ui.Image> loadImageUint8ByFile(
    String path, {
    int width,
    int height,
  }) async {
    ///通过readAsBytes来加载数据获取Uint8List数据集
    var list = await File(path).readAsBytes();
    return loadImageByUint8List(list, width: width, height: height);
  }
  ///通过File获取图片的Uint8List数据
  Future<Uint8List> loadImageUint8ListByFile(
      String path, {
        int width,
        int height,
      }) async {
    ///通过readAsBytes来加载数据获取Uint8List数据集
    var list = await File(path).readAsBytes();
    return list;
  }

//通过[Uint8List]获取图片,默认宽高[width][height]
  Future<ui.Image> loadImageByUint8List(
    Uint8List list, {
    int width,
    int height,
  }) async {
    ui.Codec codec = await ui.instantiateImageCodec(list,
        targetWidth: width, targetHeight: height);
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  ///加载Asset资源目录下的图片
  Future<ui.Image> loadImageByNet(String imageUrl,
      {ImageConfiguration config = ImageConfiguration.empty}) {
    ///通过NetworkImage来构建ImageProvider
    return loadImageByProvider(NetworkImage(imageUrl));
  }
  ///加载Asset资源目录下的图片
  Future<ui.Image> loadImageByFile(String filePath,
      {ImageConfiguration config = ImageConfiguration.empty}) {
    ///通过FileImage来构建ImageProvider
    return loadImageByProvider(FileImage(new File("filePath")));
  }
  ///加载Asset资源目录下的图片
  Future<ui.Image> loadImageByAsset(String assetPath,
      {ImageConfiguration config = ImageConfiguration.empty}) {
    ///通过AssetImage来构建ImageProvider
    return loadImageByProvider(AssetImage(assetPath));
  }

  //通过ImageProvider读取Image
  Future<ui.Image> loadImageByProvider(
    ImageProvider provider, {
    ImageConfiguration config = ImageConfiguration.empty,
  }) async {
    //完成的回调
    Completer<ui.Image> completer = Completer<ui.Image>();
    ImageStreamListener listener;
    //获取图片流
    ImageStream stream = provider.resolve(config);
    ///创建一个图片流监听
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //图片加载完获取这一帧图片
      final ui.Image image = frame.image;
      ///触发回调方法
      completer.complete(image);
      //移除监听
      stream.removeListener(listener);
    });
    ///为图片流添加监听
    stream.addListener(listener); //添加监听
    return completer.future; //返回
  }


  //保存网络图片的缩略图
  /// 主要通过PictureRecorder对Canvas进行录制，使用Canvas对图片进行重定尺寸。
  ///对图片重定义宽高尺寸[dstWidth],[dstHeight]
  Future<ui.Image> _resize(ui.Image image, int dstWidth,int dstHeight) {
    var recorder = ui.PictureRecorder();//使用PictureRecorder对图片进行录制
    Paint paint = Paint();
    Canvas canvas = Canvas(recorder);
    double srcWidth = image.width.toDouble();
    double srcHeight = image.height.toDouble();
    canvas.drawImageRect(image, //使用drawImageRect对图片进行定尺寸填充
        Rect.fromLTWH(0, 0, srcWidth, srcHeight),
        Rect.fromLTWH(0, 0, dstWidth.toDouble() ,
            dstHeight.toDouble()), paint);
    return recorder.endRecording().toImage(dstWidth, dstHeight);//返回图片
  }
  ///缩放加载[provider],缩放比例[scale]
  Future<ui.Image> scaleLoad(ImageProvider provider, double scale) async {
    var img = await loadImageByProvider(provider);
    return _resize(img, (img.width*scale).toInt(),(img.height*scale).toInt());
  }

  ///缩放加载[provider],缩放比例[scale]
  Future<ui.Image> resizeLoad(ImageProvider provider, int dstWidth,int dstHeight) async {
    var img = await loadImageByProvider(provider);
    return _resize(img, dstWidth,dstHeight);
  }
//保存一个Image
  Future<File> saveImage(ui.Image image,String path,{format=ui.ImageByteFormat.png}) async{
    var file= File(path);
    if(!await file.exists()){
      await file.create(recursive: true);
    }
    ByteData byteData = await image.toByteData(format:format);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    return file.writeAsBytes(pngBytes);
  }

/**
 * 网络图片的加载及缓存文件的有效期
 * 对于缓存文件的期限，可以用一个追踪文件进行记录，在访问网络图片时首先看有没有缓存文件
    然后看缓存文件有没有过期，如果过期，则删除，重新加载并缓存到本地。
    当然你也可以更高级一点使用Json对或数据库，或xml配置来记录缓存的失效期。
 */


  /// 检查缓存是否过期
  Future<bool> isCacheDeath(File fileDeath) async {
    if(!await fileDeath.exists()){
      return true;
    }
    var death = await fileDeath.readAsString();
    print("$death ==== ${DateTime.now().millisecondsSinceEpoch}--${int.parse(death) > DateTime.now().millisecondsSinceEpoch}");
    return int.parse(death) < DateTime.now().millisecondsSinceEpoch;
  }

}
