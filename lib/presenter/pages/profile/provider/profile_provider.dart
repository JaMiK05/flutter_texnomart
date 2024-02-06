import 'package:flutter/cupertino.dart';import '../../../../data/source/local/hive_helper.dart';class ProfileProvider extends ChangeNotifier {  int favCount = 0;  ProfileProvider() {    getAllFavCount();  }  void getAllFavCount() {    favCount = HiveHelper.getAllFavouriteProducts().length;    notifyListeners();  }  void increment() {    favCount++;    notifyListeners();  }  void decrement() {    favCount--;    notifyListeners();  }}