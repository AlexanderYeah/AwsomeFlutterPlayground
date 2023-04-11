import 'package:awsome_flutter/jiezhi/widget/dio%E5%B0%81%E8%A3%85/http_request.dart';

main(List<String> args) {
  HTTPRequest.request("/api/qq/vip", params: {"qq": "1023954998"})
      .then((value) {
    print(value);
  });
}
