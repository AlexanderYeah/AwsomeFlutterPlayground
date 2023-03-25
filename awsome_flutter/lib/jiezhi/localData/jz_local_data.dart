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
    "route": "/noti_page_a",
    "title": "通知",
    "content":
        "NSNotification是Flutter中一个重要的机制,在widget树中,每一个节点都可以发送通知，通知会沿着当前的节点（context）向上传递。",
    "tips":
        "所有的父节点都可以通过NotificationListener来监听通知，Flutter中这种通知由子向父的传递为通知冒泡。通知冒泡可以中止。"
  },
  {
    "route": "/provider_page_a",
    "title": "provider",
    "content":
        "当App复杂到一定的程度，经常会出现一个页面中不同深度的子Widget需要共同访问同一个数据状态，甚至不同页面要共享同一个数据状态。",
    "tips":
        "这是我们就会想到InheritedWidget,塔式flutter中一个重要的功能性组件，提供了一种在widget树中从上到下的数据共享方式，比如我们在应用的跟widget中通过inheritedWidget 共享了一个数据，那么我们可以在任意的子Widget中来获取共享的数据。而Provider是对inheritedWidget组件上的上层封装，使其更加容易使用，和复用。比如说购物车的全选和反选功能计算价格"
  },
  {
    "route": "/get_x_demo",
    "title": "GetX",
    "content": "GetX 是 Flutter 上的一个轻量且强大的解决方案：高性能的状态管理、智能的依赖注入和便捷的路由管理。。",
    "tips":
        "GetX 因为不需要上下文，突破了InheritedWidget的限制，我们可以在全局和模块间共享状态，这正是 BLoc 、Provider 等框架的短板"
  },
];

List jz_route_data = [
  {
    "route": "",
    "title": "GetX 管理路由",
    "content": "使用GetX 进行路由跳转非常的简单\n",
    "tips":
        "使用GetX 进行路由跳转非常的简单,只需要调用Get.to()即可进行路由跳转，而系统的路由跳转需要写八行代码，这是不能忍受的事情，而且涉及到跳转动画设置 、动画时长定义、动画曲线 等设置那就更加的复杂，而GetX为我们封装了Navigation，无需context可进行跳转，并且能很方便的使用跳转动画等"
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

List jz_theme_data = [
  {
    "route": "/international_demo",
    "title": "国际化的操作",
    "content": "本项目使用的是GetX实现的国际化",
    "tips":
        "\n 开发一个App，如果我们的App需要面向不同的语种（比如中文、英文、繁体等），那么我们需要对齐进行国际化开发。 \n App国际化开发主要包括：文本国际化（包括文本的顺序），Widget显示的国际化"
  },
];
