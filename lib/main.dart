import 'package:challenge_2/app/my_app.dart';
import 'package:challenge_2/core/data/reposotories/shared_prefernces.dart';
import 'package:challenge_2/core/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// globalSharedPreference=await SharedPreferences.getInstance();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs;
  });
  Get.put(SharedPrefrenceRepostory());
  Get.put(CartService());
  //حط بديبندسي انجكشنت

  runApp(MyApp());
}

extension emptypadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        height: toDouble(),
      );
}
