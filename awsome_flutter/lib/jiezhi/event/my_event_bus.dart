import "package:event_bus/event_bus.dart";

// 定义一个全局的eventBus
final eventBus = EventBus();

class MyEventMessage {
  String? name;
  String? action;
  MyEventMessage(this.name, this.action);
}
