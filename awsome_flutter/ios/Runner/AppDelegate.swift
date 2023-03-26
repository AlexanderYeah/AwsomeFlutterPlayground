import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, FlutterStreamHandler {
 
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      // 这是method channel 的方式
      methodChannel()
      // event channel
      eventChannel()
      // basicMessageChannel
      messageChannel()
      print("11111")
      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
            
    // messageChannel
    func messageChannel(){
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let messageChannel = FlutterBasicMessageChannel(name:"plugins.flutter.io/sayHi",
                                                 binaryMessenger: controller.binaryMessenger)
        // 因为原生向flutter 需要触发动作 这个地方就用监听到之后再去发送回去代码
        messageChannel.setMessageHandler { message, reply in
            print(message)
            messageChannel.sendMessage("当前的系统版本是:\(UIDevice.current.systemVersion),我收到的消息是:\(message)")
        }
      
       
    }
    
    // eventChannel的方式
    func eventChannel(){
        // 1.获取FlutterViewController(是应用程序的默认Controller)
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        // 2.获取MethodChannel(方法通道)
        
        let eventChannel = FlutterEventChannel(name: "plugins.flutter.io/version",
                                                 binaryMessenger: controller.binaryMessenger)
        // onListen onCancel 是它的两个代理方法
        eventChannel.setStreamHandler(self)
        
        
    }
    //
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        
        switch UIDevice.current.batteryState {
        case .charging:
                events("charging")
        case .full:
                events("full")
        default:
                events("discharging")

        }
        return nil;
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        
        return nil;
    }
    
    
//  methodChannel的方式
        
    func methodChannel(){
        
        // 1.获取FlutterViewController(是应用程序的默认Controller)
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        // 2.获取MethodChannel(方法通道)
        let batteryChannel = FlutterMethodChannel(name: "plugins.flutter.io/battery",
                                                  binaryMessenger: controller.binaryMessenger)
        
        // 3.监听方法调用(会调用传入的回调函数)
        batteryChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          // 3.1.判断是否是getBatteryInfo的调用,告知Flutter端没有实现对应的方法
          guard call.method == "getBatteryInfo" else {
            result(FlutterMethodNotImplemented)
            return
          }
          // 3.2.如果调用的是getBatteryInfo的方法, 那么通过封装的另外一个方法实现回调
          self?.receiveBatteryLevel(result: result)
        })
    }
    
    private func receiveBatteryLevel(result: FlutterResult) {
      // 1.iOS中获取信息的方式
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      
      // 2.如果没有获取到,那么返回给Flutter端一个异常
        // 这里方便测试 直接返回
        result("89")
//      if device.batteryState == UIDevice.BatteryState.unknown {
//        result(FlutterError(code: "UNAVAILABLE",
//                            message: "Battery info unavailable",
//                            details: nil))
//      } else {
//        // 3.通过result将结果回调给Flutter端
//        result(Int(device.batteryLevel * 100))
//      }
    }
    
    
}
