import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api/api_service.dart';
import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  APIService service = APIService();
  final emailCon = TextEditingController();
  final passCon = TextEditingController();
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login() async {
    final res = await service.login(email: emailCon.text, pass: passCon.text);
    res.fold((left) => Get.snackbar('Message', left), (right) async {
      print('token ${right.token}');
      await saveToken(right.token);
    });
    isLogged.value = true;
    //Token is cached
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
