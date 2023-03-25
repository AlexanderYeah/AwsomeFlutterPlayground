import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class CommunicateHTMLPage extends StatefulWidget {
  const CommunicateHTMLPage({super.key});

  @override
  State<CommunicateHTMLPage> createState() => _CommunicateHTMLPageState();
}

// 参考:https://www.jianshu.com/p/d9327b3c2b29
class _CommunicateHTMLPageState extends State<CommunicateHTMLPage> {
  WebViewController? _controller;
  bool isLoading = false; // 加载状态
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化控制器
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: ((int progress) {
          print("progress --${progress}");
        }),
        onPageFinished: (url) async {
          // 页面加载完成之后 这里可以给H5 页面发送消息
          Future.delayed(Duration(seconds: 1), () {
            _controller!
                .runJavaScript("fromFlutterMessage('这里是来自Flutter的信息 嘎嘎嘎嘎嘎')");
          }).then((value) => print("向H5发送消息成功"));
        },
      ))
      // 可以添加多个channel
      // 这个MessageDeal是和Flutter里JavascriptChannel中的name一致的。
      // 不用自己确切的定义，只要Flutter和js里保持一样就可以
      // 这里我最开始看这个的时候一直没搞懂MessageDeal是什么，后来敲了一遍代码终于明白了，
      // 这个其实和MethodChannle中的channel字符串有类似的意思，唯一标识
      // MessageDeal 在script 方法中 MessageDeal.postMessage(message);
      ..addJavaScriptChannel("MessageDeal", onMessageReceived: (message) {
        print(message.message);
      })
      ..addJavaScriptChannel("OpenCamera", onMessageReceived: (message) {
        print(message.message);
      })
      ..loadFile(
          "/Users/alexander/Desktop/Personal/Code/Git/Flutter/AwsomeFlutter/awsome_flutter/assets/widget_test_h5.html");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("H5 交互")),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                    child: WebViewWidget(controller: _controller!),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top)),
              ],
            )));
  }
}
