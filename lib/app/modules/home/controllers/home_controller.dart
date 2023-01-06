import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suppliers_rahmattobi/app/data/models/produk.dart';
import 'dart:convert';


class HomeController extends GetxController {
  TextEditingController? namaS;
  TextEditingController? alamatS;
  TextEditingController? telpS;


  @override
  void onInit() {
    super.onInit();
    namaS = TextEditingController();
    alamatS = TextEditingController();
    telpS = TextEditingController();
  }

  Future<void> inputSupplier(
    String? namaSupplier,
    String? alamat,
    String? noTelp,
    String? token,
  ) async {
    try {
      var url = 'http://159.223.57.121:8090/supplier/create';
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': ' Bearer $token',
      };

      var body = jsonEncode({
        'namaSupplier': namaSupplier,
        'alamat': alamat,
        'noTelp': noTelp,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar(
          "Berhasil",
          "Berhasil Menambahkan Supplier !!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        update();
        clearText();
      } else {
        throw Exception('Gagal Menambahkan Supplier');
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Gagal",
        "Gagal Menambahkan Supplier !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<List<Supplier>?> getSupliers(String? token) async {
    Uri url = Uri.parse(
        'http://159.223.57.121:8090/supplier/find-all?offset=${1}&limit=${20}');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': ' Bearer $token',
    };
    var res = await http.get(
      url,
      headers: headers,
    );

    List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Supplier.fromJson(e)).toList();
    }
  }

  Future deleteSuppliers(int id, String? token) async {
    Uri url = Uri.parse('http://159.223.57.121:8090/supplier/delete/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': ' Bearer $token',
    };

    var res = await http.delete(
      url,
      headers: headers,
    );
    if (res.statusCode == 200) {
      Get.snackbar(
        "Berhasil",
        "Berhasil Menghapus Produk",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      update();
    } else {
      Get.snackbar(
        "Error",
        "Gagal Menghapus Produk !!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> updateSupplier(
    int? id,
    String? namaSupplier,
    String? alamat,
    String? noTelp,
    String? token,
  ) async {
    try {
      var url = 'http://159.223.57.121:8090/supplier/update/$id';
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': ' Bearer $token',
      };

      var body = jsonEncode({
        'namaSupplier': namaSupplier,
        'alamat': alamat,
        'noTelp': noTelp,
      });

      var response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar(
          "Berhasil",
          "Berhasil Mengubah Supplier !!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearText();
        update();
      } else {
        throw Exception('Gagal Mengubah Supplier');
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Gagal",
        "Gagal Mengubah Supplier !!",
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
    namaS!.dispose();
    alamatS!.dispose();
    telpS!.dispose();
    super.onClose();
  }

  void clearText() {
    namaS!.clear();
    alamatS!.clear();
    telpS!.clear();
  }
}


  // Future<void> getAllProduct() async {
  //   Uri url = Uri.parse(baseUrl);

  //   var res = await http.get(url);

  //   print(res.body);
  //   // List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"]["data"];

  //   // return data.map((e) => Product.fromJson(e)).toList();
  // }


