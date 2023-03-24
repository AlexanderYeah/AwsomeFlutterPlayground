import 'package:awsome_flutter/service/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternatonalController extends GetxController {
  void changeLanguage(String languageCode, String countryCode) {
    var local = Locale(languageCode, countryCode);
    Get.updateLocale(local);
  }
}
