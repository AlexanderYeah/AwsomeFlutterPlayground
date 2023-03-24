import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetXDemoController extends GetxController {
  // 通过.obs将inputStatus标记为被观察者
  var inputStatus = "未输入".obs;
  inputFinish(res) {
    // 可以绑定传递进来的结果
    inputStatus.value = res;
    print(res);
  }
}
