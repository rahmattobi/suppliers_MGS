import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
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

  Future<void> register(
    String? profileName,
    String? username,
    String? password,
  ) async {
    try {
      var url = 'http://159.223.57.121:8090/auth/register';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'profileName': profileName,
        'username': username,
        'password': password,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          "Berhasil Login !!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAndToNamed(Routes.login);
      } else {
        throw Exception('Gagal Register');
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Gagal Register'),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Text(
                e.toString(),
              ),
            ],
          );
        },
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
