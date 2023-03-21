List jz_content_data = [
  {"title": "初识Flutter", "content": "1231321"},
  {"title": "Flutter 组件", "content": "1231321"},
  {"title": "状态管理", "content": "1231321"},
  {"title": "事件处理", "content": "1231321"},
  {"title": "路由管理", "content": "1231321"},
  {
    "title": "动画",
    "content": "在Flutter开发中，涉及三个核心动画类，Animation,Animatable,AnimationController"
  },
  {"title": "网络编程", "content": "1231321"},
  {"title": "数据存储", "content": "1231321"},
  {"title": "相机", "content": "1231321"},
  {"title": "主题与国际化", "content": "1231321"},
  {"title": "混合开发", "content": "1231321"},
];

List jz_widget_data = [
  {
    "title": "Text以及RichText",
    "content": "文本组件,如android 开发中的TextView",
    "tips": "显示文字以及丰富的样式，包含大小粗细阴影"
  },
  {
    "title": "Button",
    "content": "Flutter 没有给出Button组件,而是直接给出了各式各样的button组件",
    "tips":
        "常用的RaisedButton,FlatButton,IconButton,OutlineButton,FloatingActionButton的Button 组件, Flutter 3的SDK弃用了其中几种\n 1> FlatButton 被替换为TextButton,\n 2> RaisedButton 被替换为 ElevatedButton \n 3>OutlineButton 被替换为OutlinedButton"
  },
];

List jz_state_data = [
  {
    "title": "通知",
    "content":
        "NSNotification是Flutter中一个重要的机制,在widget树中,每一个节点都可以发送通知，通知会沿着当前的节点（context）向上传递。",
    "tips":
        "所有的父节点都可以通过NotificationListener来监听通知，Flutter中这种通知由子向父的传递为通知冒泡。通知冒泡可以中止。"
  },
];

List jz_Animation_data = [
  {
    "title": "Animation 对象",
    "content":
        "它是一个抽象类，具体功能实现由 其子类完成。\n 1>AnimationController  动画控制器 \n 2>initState 中初始化动画控制器 \n 3> 混入TickProviderStateMixin \n 4> 参考：https://juejin.cn/post/6979836293232459812\n",
    "tips":
        " flutter中动画分为两类：基于tween或基于物理的。补间(Tween)动画“介于两者之间”的简称。在补间动画中，定义了开始点和结束点、时间线以及定义转换时间和速度的曲线。然后由框架计算如何从开始点过渡到结束点。基于物理的动画在基于物理的动画中，运动被模拟为与真实世界的行为相似。例如，当你掷球时，它在何处落地，取决于抛球速度有多快、球有多重、距离地面有多远。 类似地，将连接在弹簧上的球落下（并弹起）与连接到绳子上的球放下的方式也是不同。"
  },
];

List jz_storage_data = [
  {
    "title": "share_preferences 的使用",
    "content": "这个可以实现对数据简单的保存和读取账号密码",
    "tips": "\n iOS设备是基于NSUserDefaults开发的,\n Android 设备是基于SharePreference开发的"
  },
];
