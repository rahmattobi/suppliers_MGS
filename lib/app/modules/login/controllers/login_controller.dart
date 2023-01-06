import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suppliers_rahmattobi/app/data/models/user.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController? nameC;
  TextEditingController? passC;
  TextEditingController? usernameC;

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    passC = TextEditingController();
    usernameC = TextEditingController();
  }

  Future<void> login(
    String? username,
    String? password,
  ) async {
    try {
      var url = 'http://159.223.57.121:8090/auth/login';
      var headers = {
        'Content-Type': 'application/json',
      };
      // ignore: unrelated_type_equality_checks
      var body = jsonEncode({
        'username': username,
        'password': password,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data);
        Get.snackbar(
          "Berhasil",
          "Berhasil Login !!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAndToNamed(Routes.home, arguments: user);
      } else {
        throw Exception('Gagal Login');
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Gagal Login !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameC!.dispose();
    passC!.dispose();
    usernameC!.dispose();
    super.onClose();
  }
}
