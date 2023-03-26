import 'package:awsome_flutter/util/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommunicateDevicePage extends StatefulWidget {
  const CommunicateDevicePage({super.key});

  @override
  State<CommunicateDevicePage> createState() => _CommunicateDevicePageState();
}

// 主参考：https://www.cnblogs.com/duzhaoquan/p/15810270.html
// https://blog.csdn.net/china_2014/article/details/111992010
class _CommunicateDevicePageState extends State<CommunicateDevicePage> {
  String _methodChannelText = "";
  /*****--- 1 MethodChannel 通信***-----*/
  // 用于传递方法调用
  // 定义一个 MethodChannel 这个name 必须和原生代码中的名字一样
  MethodChannel _channel = MethodChannel("plugins.flutter.io/battery");
  // 用channel 调用 invokeMethod，调用方法 方法名字必须和原生代码的一样
  Future<String> _getBatteryVol() async {
    String vol = await _channel.invokeMethod('getBatteryInfo');
    print(vol);
    setState(() {
      _methodChannelText = vol;
    });
    return vol;
  }

  /*****--- 2 EventChannel 通信***-----*/
  // 参考:https://blog.csdn.net/vitaviva/article/details/104253660?spm=1001.2101.3001.6650.2&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-2-104253660-blog-90598804.235%5Ev27%5Epc_relevant_3mothn_strategy_and_data_recovery&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-2-104253660-blog-90598804.235%5Ev27%5Epc_relevant_3mothn_strategy_and_data_recovery&utm_relevant_index=5
  // 其中EventChannel用于从native向flutter发送通知事件，例如flutter通过其监听Android的重力感应变化等。与MethodChannel不同，EventChannel是native到flutter的单向调用，调用是多播（一对多）的，可以类比成Android的Brodcast。
  String _eventChannelText = "";
  EventChannel _eventChannel = EventChannel("plugins.flutter.io/version");
  Future<String> _getVersion() async {
    var string = "";
    _eventChannel.receiveBroadcastStream().listen((event) {
      setState(() {
        _eventChannelText = event;
      });
    });
    return "Get Nothing";
  }

/*****--- 3 BasicMessageChannel 通信***-----*/
  String _messageChannelText = "";
  BasicMessageChannel _messageChannel =
      BasicMessageChannel("plugins.flutter.io/sayHi", StandardMessageCodec());
  _sendMessageChannel() {
    _messageChannel.send("Hello There, I am the dart");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听原生发送的消息
    _messageChannel.setMessageHandler((message) async {
      setState(() {
        _messageChannelText = message;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter 和 原生进行通信"),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("用MethodChannel 获取的返回是:" + "${_methodChannelText}"),
            ElevatedButton(
                onPressed: _getBatteryVol, child: Text("MethodChannel 使用")),
            SizedBox(
              height: 30,
            ),
            Text("用EventChannel 获取的返回是:" + "${_eventChannelText}"),
            ElevatedButton(
                onPressed: () async {
                  String str = await _getVersion();
                  setState(() {
                    _eventChannelText = str;
                  });
                },
                child: Text("用EventChannel 使用")),
            SizedBox(
              height: 30,
            ),
            Text("用MessageChannel 获取的返回是:" + "${_messageChannelText}"),
            ElevatedButton(
                onPressed: () {
                  _sendMessageChannel();
                },
                child: Text("用MessageChannel 使用")),
            Edit.instance()
                .header("可以native之间可以通过Platform Channels APIs进行通信，API主要有以下三种："),
            Edit.instance().header("1 MethodChanel"),
            Edit.instance().text("用于传递方法调用（method invocation）"),
            Edit.instance().header("2 EventChannel"),
            Edit.instance().text("用于事件流的发送"),
            Edit.instance().header("3 MessageChannel"),
            Edit.instance().text("用于传递字符串和半结构化的消息"),
          ],
        ));
  }
}
