import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/produk.dart';

class ProdukController extends GetxController {
  TextEditingController? namaB;
  TextEditingController? hargaB;
  TextEditingController? stokB;
  TextEditingController? namaS;
  TextEditingController? alamatS;
  TextEditingController? telpS;

  @override
  void onInit() {
    super.onInit();
    namaS = TextEditingController();
    alamatS = TextEditingController();
    telpS = TextEditingController();
    namaB = TextEditingController();
    hargaB = TextEditingController();
    stokB = TextEditingController();
  }

  Future<List<Produk>?> getProduk(String? token) async {
    Uri url = Uri.parse(
        'http://159.223.57.121:8090/barang/find-all?offset=${1}&limit=${20}');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': ' Bearer $token',
    };
    var res = await http.get(
      url,
      headers: headers,
    );

    List data = (jsonDecode(res.body) as Map<String, dynamic>)['data'];
    print(data);
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Produk.fromJson(e)).toList();
    }
  }

  Future<void> inputProduk(
    String? namaBarang,
    int? stok,
    double? harga,
    String? namaSupplier,
    String? alamat,
    String? noTelp,
    String? token,
  ) async {
    try {
      var url = 'http://159.223.57.121:8090/barang/create';
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': ' Bearer $token',
      };

      var body = jsonEncode({
        "harga": harga,
        "namaBarang": namaBarang,
        "stok": stok,
        "supplier": {
          'alamat': alamat,
          'namaSupplier': namaSupplier,
          'noTelp': noTelp,
        }
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

  Future deleteProduk(int id, String? token) async {
    Uri url = Uri.parse('http://159.223.57.121:8090/barang/delete/$id');
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

  Future<void> updateProduk(
    String? namaBarang,
    int? stok,
    double? harga,
    String? namaSupplier,
    String? alamat,
    String? noTelp,
    String? token,
    int? id,
    int? idSupp,
  ) async {
    try {
      var url = 'http://159.223.57.121:8090/barang/update/$id';
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': ' Bearer $token',
      };

      var body = jsonEncode({
        "harga": harga,
        "namaBarang": namaBarang,
        "stok": stok,
        "supplier": {
          'id': idSupp,
          'alamat': alamat,
          'namaSupplier': namaSupplier,
          'noTelp': noTelp,
        }
      });

      var response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          "Berhasil Mengubah data !!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        clearText();
        update();
      } else {
        throw Exception('Gagal Mengubah data');
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Gagal",
        "Gagal Mengubah data s!!",
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
    namaB!.dispose();
    hargaB!.dispose();
    stokB!.dispose();
    super.onClose();
  }

  void clearText() {
    namaS!.clear();
    alamatS!.clear();
    telpS!.clear();
    namaB!.clear();
    hargaB!.clear();
    stokB!.clear();
  }
}
