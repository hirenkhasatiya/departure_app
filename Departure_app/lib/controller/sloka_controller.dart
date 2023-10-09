import 'package:flutter/material.dart';

class slokacontroller extends ChangeNotifier {
  bool translate = true;
  bool list = true;

  languageChange() {
    translate = !translate;
    notifyListeners();
  }

  listchange() {
    list = !list;
    notifyListeners();
  }
}
