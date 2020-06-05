import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/base/xy_page.dart';

main() {
  runApp(MaterialApp(
    home: OsChinaLoginPage(),
  ));
}

//lib/code10/main_data1104.dart
/// 注册页面
class OsChinaLoginPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code10/main_data1104.dart
///一个登录页面
///因为页面中需要监听键盘的弹出，所以这里混入了 WidgetsBindingObserver
///因为页面中有多组动画效果，所以这晨混入了 ickerProviderStateMixin
class _PageState extends State with WidgetsBindingObserver ,TickerProviderStateMixin{

  ///RichText中隐私协议的手势
  TapGestureRecognizer _privacyProtocolRecognizer;
  ///RichText中注册协议的手势
  TapGestureRecognizer _registProtocolRecognizer;
  ///用户手机号输入框TextField的控制器
  TextEditingController _userPhoneTextController;
  ///用户密码输入框TextField的控制器
  TextEditingController _userPasswrodtController;


  ///手机号焦点控制
  FocusNode userPhoneFieldNode = new FocusNode();
  ///用户密码焦点控制
  FocusNode userPasswordFieldNode = new FocusNode();

  ///正在输入TextField的边框颜色
  Color selectColor = Colors.green;
  ///未在输入TextField的边框颜色
  Color normalColor = Color(0x80fafafa);
  ///是否可以注册
  bool isRegister = false;
  
  //Logo动画控制器
  AnimationController logoAnimatController;
  Animation logoAnimation;

  //注册动画控制器
  AnimationController registerAnimatController;

  //输入框动画控制器
  //当输入的手机号不合格或者是密码不合格时
  //通过此动画实现抖动效果
  AnimationController inputAnimatController;
  Animation inputAnimaton;
  ///抖动动画执行次数
  int inputAnimationNumber =0;

  ///输入手机号码合格标识
  /// 11位为合格，此值为false 否则为为true不合格
  bool isPhoneError = false;
  ///输入密码合格标识
  /// 6-12位为合格，此值为false 否则为true不合格
  bool isPasswordError = false;
  ///同意协议标识
  bool isAgreentError = false;
  ///注册状态
  RestureStatus currentRestureStatus=RestureStatus.none;

  //lib/code10/main_data1104.dart
  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    ///初始化顶部Logo相关动画
    initLogoAnimationFunction();
    ///初始化输入框相关动画
    initInputAnimationFunction();
    ///初始化注册相关动画
    initRegisterAnimationFunction();
    ///初始化输入框控制器
    initInputControllerFunction();
    //添加监听
    WidgetsBinding.instance.addObserver(this);
  }
  //lib/code10/main_data1104.dart
  ///生命周期函数 页面销毁时执行一次
  @override
  void dispose() {
    super.dispose();
    ///logo动画控制器释放
    logoAnimatController.dispose();
    ///输入框动画控制器
    inputAnimatController.dispose();
    ///注册动画控制器释放
    registerAnimatController..dispose();
    //解绑
    WidgetsBinding.instance.removeObserver(this);
    ///注册协议手势释放
    _registProtocolRecognizer.dispose();
    _privacyProtocolRecognizer.dispose();
    ///焦点释放
    userPhoneFieldNode.unfocus();
    userPasswordFieldNode.unfocus();
  }

  void initInputControllerFunction(){
    //输入手机号TextField控制器
    _userPhoneTextController = TextEditingController();
    //输入密码TextField控制器
    _userPasswrodtController = TextEditingController();
    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();
    //添加手机号输入监听
    _userPhoneTextController.addListener(() {
      checkRegister();
    });
    //添加密码输入监听
    _userPhoneTextController.addListener(() {
      checkRegister();
    });
    _userPasswrodtController.addListener(() {
      checkRegister();
    });
  }
  void initInputAnimationFunction(){

    inputAnimatController=
        AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    inputAnimaton = new Tween(begin: 0.0, end: 10.0).animate(inputAnimatController);
    inputAnimatController.addListener(() {
      double value = inputAnimatController.value;
      print("变化比率 $value");
      setState(() {
      });
    });
    inputAnimatController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("正向执行完毕 ");
        inputAnimationNumber++;
        inputAnimatController.reverse();
      }else if(status == AnimationStatus.dismissed){
        print("反向执行完毕 ");
        inputAnimatController.reset();
        if(inputAnimationNumber<2){
          inputAnimatController.forward();
        }else{
          inputAnimationNumber=0;
        }

      }
    });
  }
  void initRegisterAnimationFunction(){
    registerAnimatController =
        AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    registerAnimatController.addListener(() {
      double value = registerAnimatController.value;
      print("注册变化比率 $value");
      setState(() {
      });
    });
    registerAnimatController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("正向执行完毕 ");
      }else if(status == AnimationStatus.dismissed){
        print("反向执行完毕 ");
        registerAnimatController.reset();
        currentRestureStatus=RestureStatus.none;
      }
    });
  }

  void initLogoAnimationFunction(){
    logoAnimatController =
        AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    logoAnimatController.addListener(() {
      setState(() {
      });
    });
    logoAnimation=Tween(begin: 1.0, end: 0.0).animate(logoAnimatController);
  }
  //应用尺寸改变时回调
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        double keyboderFlexHeight = MediaQuery.of(context).viewInsets.bottom;
        print("键盘的高度 keyboderFlexHeight $keyboderFlexHeight");
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          //关闭键盘
          logoAnimatController.reverse();
        } else {
          //显示键盘
          logoAnimatController.forward();
        }
      });
    });
  }

  checkRegister() {
    String phone = _userPhoneTextController.text;
    String password = _userPhoneTextController.text;
    if (phone.length == 11 && password.length > 6) {
      if (isRegister == false) {
        isRegister = true;
        setState(() {});
      }
    } else {
      if (isRegister == true) {
        isRegister = false;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //阻止界面resize
      resizeToAvoidBottomInset : false,
      body: GestureDetector(
        onTap: () {
          //隐藏键盘
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          //输入框失去焦点
          userPhoneFieldNode.unfocus();
          userPasswordFieldNode.unfocus();
        },
        child: Stack(
          children: [
            ///构建背景
            buildBgWidget(),
             ///构建高斯模糊层
            buildBlurBg(),
            ///构建用户信息输入框
            buildLoginInputWidget(),
          ],
        ),
      ),
    );
  }


  Widget buildRoot(BuildContext context) {
    return Scaffold(
      ///层叠布局
      body: Stack(
          children: [
            ///构建背景
            buildBgWidget(),
            ///构建高斯模糊层
            buildBlurBg(),
            ///构建用户信息输入框
            buildLoginInputWidget(),
          ],
        ),
    );
  }




  ///构建填充页面的背景图片
  buildBgWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Image.asset(
        "assets/images/2.0x/bg_kyzg_login2.png",
        fit: BoxFit.fill,
      ),
    );
  }

  ///构建透明遮罩图层
  buildBlurBg() {
    return Container(
      color: Color.fromARGB(
        155,
        100,
        100,
        100,
      ),
    );
  }

  ///构建用户信息输入框
  buildLoginInputWidget() {
    ///填充
    return Positioned(left: 0, right: 0, top: 0, bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        ///竖直方向的线性布局
        child: Column(
            children: [
              ///顶部距离
              Container(
                margin: EdgeInsets.only(left: 22, right: 22, top: 100.0*logoAnimation.value),
              ),
              ///logo
              buildLogoWidget(),
              //间隔
              SizedBox(height: 30,),
              buildUserRowWidgets("请输入11位手机号",
                  userPhoneFieldNode, Icons.phone_android,
                  11, _userPhoneTextController,isError: isPhoneError),
              ///间隔
              Container(
                margin: EdgeInsets.only(left: 22, right: 22, top: 20),
              ),
              buildUserRowWidgets("请输入6-12位密码",
                  userPasswordFieldNode, Icons.lock_open,
                  12, _userPasswrodtController,isPassword: true,isError: isPasswordError),
              ///用户协议
              buildAgreementWidget(),
              ///间隔
              Container(
                margin: EdgeInsets.only(left: 22, right: 22, top: 40),
              ),
              ///构建注册按钮
              buildRegisterButton(),
            ],
          ),),
    );
  }

  buildAgreementWidget() {
    return Container(
      margin: EdgeInsets.only(left: 22, right: 22, top: 10),
      child: Row(
        children: [
          buildCircleCheckBox(),
          SizedBox(
            width: 1,
          ),
          Expanded(
            child: RichText(
              ///文字区域
              text: TextSpan(
                  text: "注册同意",
                  style: TextStyle(color: Color(0xaafafafa)),
                  children: [
                    TextSpan(
                        text: "《用户注册协议》",
                        style: TextStyle(color: Colors.orange),
                        //点击事件
                        recognizer: _registProtocolRecognizer
                          ..onTap = () {
                            print("点击用户协议");
                          }),
                    TextSpan(
                      text: "与",
                      style: TextStyle(color: Color(0xaafafafa)),
                    ),
                    TextSpan(
                        text: "《隐私协议》",
                        style: TextStyle(color: Colors.orange),
                        //点击事件
                        recognizer: _privacyProtocolRecognizer
                          ..onTap = () {
                            print("点击隐私协议");
                          })
                  ]),
            ),
          )
        ],
      ),
    );
  }

  //lib/code10/main_data1103.dart
  ///复选框的选中标识
  bool checkIsSelect = false;

  ///使用图片素材自定义圆形自选框
  buildCircleCheckBox() {
    return Container(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          setState(() {
            checkIsSelect = !checkIsSelect;
          });
        },
        child: Transform.scale(scale: computeAgrementScale(),child: Image.asset(
          checkIsSelect
              ? "assets/images/2.0x/no_select_icon.png"
              : "assets/images/2.0x/select_icon.png",
          width: 18,
          height: 18,
        ),),
      ),
    );
  }
  ///缩放抖动值计算
  double computeAgrementScale(){
    double scale = 1.0;
    if(isAgreentError){
      double value = inputAnimaton.value;
      scale = value/20+1.0;
    }
    return scale;
  }


  buildUserRowWidgets(String hintText, FocusNode focusNode,
      IconData preIconData, int maxLenght, TextEditingController controller,
      {bool isPassword = false, bool isError = false}) {
    ///平移动画 实现抖动效果
    return Transform.translate(
      offset: Offset(isError ? inputAnimaton.value : 0, 0),
      child: Container(
        margin: EdgeInsets.only(
          left: 22,
          right: 22,
        ),
        ///圆角矩形背景
        decoration: BoxDecoration(
            color: Color(0x50fafafa),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(
                color: focusNode.hasFocus ? selectColor : normalColor)),
        child: Row(
          children: [
            ///小图标
            Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Icon(
                preIconData,
                size: 26,
                color: Color(0xaafafafa),
              ),
            ),
            ///竖线
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 1,
                height: 26,
                color: Color(0xaafafafa),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                //隐藏输入的文本
                obscureText: isPassword ? true : false,

                ///设置键盘的类型
                keyboardType: isPassword
                    ? TextInputType.visiblePassword
                    : TextInputType.text,

                ///键盘回车键的样式
                textInputAction:
                    isPassword ? TextInputAction.done : TextInputAction.next,

                ///点击键盘上的回车按钮回调事件函数
                ///参数[value]获取的是当前TextField中输入的内容
                onSubmitted: (value) {
                  if (isPassword) {
                    //触发注册按钮
                    registerSubmitFunction();
                  } else {
                    // 电话输入失去焦点
                    userPhoneFieldNode.unfocus();
                    //密码输入  获取焦点
                    FocusScope.of(context).requestFocus(userPasswordFieldNode);
                  }
                },

                ///输入文本格式过滤
                inputFormatters: [
                  ///输入的内容长度为 maxLength 位
                  LengthLimitingTextInputFormatter(maxLenght),
                ],
                style: TextStyle(fontSize: 16.0, color: Colors.white),
                maxLines: 1,
                textDirection: TextDirection.ltr,
                minLines: 1,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0xaafafafa)),
                  border: InputBorder.none,
                ),
              ),
            ),
            ///清除选项
            focusNode.hasFocus
                ? InkWell(
                    onTap: () {
                      controller.text = "";
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 12),
                      child: Icon(
                        Icons.cancel,
                        size: 22,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  ///注册按钮
  buildRegisterButton() {
    ///点击事件
    return InkWell(
      onTap: () {
        registerSubmitFunction();
      },
      ///加载进度圆圈与底层显示
      child: Stack(
        children: [
          ///缩放变换
          Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.diagonal3Values(computeLoadinBgOpacity(), 1.0, 1.0),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 48,
              margin: EdgeInsets.only(
                left: 22,
                right: 22,
              ),
              decoration: BoxDecoration(
                  color: Color(0x50fafafa),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: normalColor)),
              child: Opacity(
                opacity: (1.0 - registerAnimatController.value),
                child: Text(
                  "注册",
                  style: TextStyle(
                      fontSize: 18,
                      color: isRegister ? Colors.white : normalColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          ///进度圆圈
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: computeLoadinOpacity(),
                child: Container(
                    height: 48.0,
                    width: 48.0,
                    padding: EdgeInsets.all(10),
                    child: buildLoadingWidget(),
                    decoration: BoxDecoration(
                      color: Color(0x50fafafa),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
  ///计算进度圆圈的透明度
  double computeLoadinOpacity(){
    double opacity = 0.0;
    double registValue = registerAnimatController.value;
    if(registValue>0.7){
      opacity = registValue;
    }
    return opacity;
  }
  ///计算注册按钮的背景透明度
  double computeLoadinBgOpacity(){
    double opacity = 0.0;
    double registValue = registerAnimatController.value;
    if(registValue>0.7){
      opacity = 0.0;
    }else{
      opacity = 1.0-registValue;
    }
    return opacity;
  }
  ///动态构建不同的显示进度圆圈
  /// 加载中、加载错误、加载成功
  Widget buildLoadingWidget(){
    Widget loadingWidget =  CircularProgressIndicator();
    if (currentRestureStatus == RestureStatus.success) {
      loadingWidget = Icon(Icons.check,color: Colors.deepOrangeAccent,);
    } else if (currentRestureStatus == RestureStatus.error) {
      loadingWidget = Icon(Icons.close,color: Colors.red,);
    }
    return loadingWidget;

  }

  ///构建logo
  buildLogoWidget() {
    ///缩放布局
    return ScaleTransition(
      //设置动画的缩放中心
      alignment: Alignment.center,
      //动画控制器
      scale: logoAnimation,
      //将要执行动画的子view
      child: Row(
        ///主方向子View居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            ///圆角矩形
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                "assets/images/2.0x/logo.jpg",
                height: 44,
                width: 44,
              ),
            ),
            padding: EdgeInsets.only(right: 14),
          ),
          Text(
            "Flutter Study",
            style: TextStyle(

                ///文字的大小
                fontSize: 20,
                color: Colors.white,

                ///引用圆滑的自定义字体
                fontFamily: "UniTortred"),
          )
        ],
      ),
    );
  }

  ///注册功能
  void registerSubmitFunction() {

    ///隐藏输入框焦点
    userPasswordFieldNode.unfocus();
    userPhoneFieldNode.unfocus();

    ///获取输入的mwwp
    String inputPhone = _userPhoneTextController.text;
    if(inputPhone.length!=11){
      isPhoneError = true;
      inputAnimatController.forward();
      return;
    }else{
      isPhoneError = false;
    }
    String inputPassword = _userPasswrodtController.text;
    if(inputPassword.length<6){
      isPasswordError = true;
      inputAnimatController.forward();
      return;
    }else{
      isPasswordError = false;
    }

    if(!checkIsSelect){
      isAgreentError=true;
      inputAnimatController.forward();
      return;
    }else{
      isAgreentError = false;
    }

    if(currentRestureStatus==RestureStatus.none){
      ///更新状态为加载中
      currentRestureStatus = RestureStatus.loading;
      ///开启过渡动画
      registerAnimatController.forward();
      ///模拟网络请求 4 秒
      Future.delayed(Duration(milliseconds: 4000),(){

        ///模拟请求成功
//        setState(() {
//          currentRestureStatus=RestureStatus.success;
//        });
       ///模拟请求失败
        setState(() {
          currentRestureStatus=RestureStatus.error;
        });

        Future.delayed(Duration(milliseconds: 1000),(){
          registerAnimatController.reverse();
        });
//      registerAnimatController.reverse();
      });
    }

  }
}

enum RestureStatus{
  none,//无状态
  loading,//加载中
  success,//加载成功
  error,//加载失败
  rever,//重试
}