

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572


class UserBean{
  String userName;
  String userFlag;

  UserBean(this.userName, this.userFlag,);

   UserBean.fromJson(Map<String, dynamic> map) {
   this.userName = map["userName"];
   this.userFlag = map["userFlag"];
  }

}
