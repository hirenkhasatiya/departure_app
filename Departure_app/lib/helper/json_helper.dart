import 'dart:convert';

import 'package:flutter/services.dart';

class JsonHelper {
  JsonHelper._();
  static final JsonHelper jsonHelper = JsonHelper._();

  Future<List> getSloka() async {
    String data = await rootBundle.loadString('assets/Json/bhagvat_gita.json');

    List allsloka = jsonDecode(data);

    return allsloka;
  }
}
