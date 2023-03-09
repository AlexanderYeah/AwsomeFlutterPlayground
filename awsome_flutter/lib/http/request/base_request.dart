// 定义请求方法一个枚举
import 'package:flutter/widgets.dart';

enum HttpMethod {
  GET,
  POST,
  DELETE,
}

abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String domain() => "www.baidu.com";
  // 定义方法给派生类去实现
  HttpMethod httpMethod();
  String path();
  // 返回一个URL 请求链接

  String url() {
    Uri uri;
    var pathStr = path();
    // 拼接path 参数
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(domain(), pathStr, pathParams);
    } else {
      uri = Uri.http(domain(), pathStr, pathParams);
    }
    print(uri.toString());
    return uri.toString();
  }

  // 判断是否需要登录才能访问接口
  bool isNeedLogin();
  // 参数
  Map<String, String> params = Map();
  // 添加参数
  BaseRequest add(String key, Object value) {
    params[key] = value.toString();
    return this;
  }

  // 鉴权头部
  Map<String, dynamic> header = Map();

  BaseRequest addHeader(String key, Object value) {
    header[key] = value.toString();
    return this;
  }
}
