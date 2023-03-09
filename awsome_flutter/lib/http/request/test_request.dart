import 'package:awsome_flutter/http/request/base_request.dart';

class TestRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.GET;
  }

  @override
  bool isNeedLogin() {
    // TODO: implement isNeedLogin
    return false;
  }

  @override
  String path() {
    // TODO: implement path
    return "/home/banner/test";
  }
}
