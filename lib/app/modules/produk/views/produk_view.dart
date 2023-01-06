import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:suppliers_rahmattobi/app/data/models/user.dart';
import 'package:suppliers_rahmattobi/app/modules/home/controllers/home_controller.dart';
import 'package:suppliers_rahmattobi/theme.dart';

import '../../../data/models/produk.dart';
import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  ProdukView({Key? key}) : super(key: key);

  var dropdownvalue;
  UserModel user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          right: defaultMargin,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  'Produk Page',
                  style: titleColorTextstyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'List Produk',
                    style: titleColorTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                            child: AlertDialog(
                          title: Text(
                            "Input Barang",
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Barang",
                                  style: subTitleColorTextstyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: titleColor.withOpacity(0.2),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: controller.namaB,
                                    style: titleColorTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Nama Barang',
                                      border: InputBorder.none,
                                      hintStyle:
                                          subTitleColorTextstyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Harga Barang",
                                  style: subTitleColorTextstyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: titleColor.withOpacity(0.2),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: controller.hargaB,
                                    style: titleColorTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Harga Barang",
                                      border: InputBorder.none,
                                      hintStyle:
                                          subTitleColorTextstyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Stok Barang",
                                  style: subTitleColorTextstyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: titleColor.withOpacity(0.2),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: controller.stokB,
                                    style: titleColorTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Stok Barang",
                                      border: InputBorder.none,
                                      hintStyle:
                                          subTitleColorTextstyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Nama Supplier",
                                  style: subTitleColorTextstyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: titleColor.withOpacity(0.2),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: controller.namaS,
                                    style: titleColorTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Nama Supplier',
                                      border: InputBorder.none,
                                      hintStyle:
                                          subTitleColorTextstyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Alamat Supplier",
                                  style: subTitleColorTextstyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: titleColor.withOpacity(0.2),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: controller.alamatS,
                                    style: titleColorTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Alamat Supplier",
                                      border: InputBorder.none,
                                      hintStyle:
                                          subTitleColorTextstyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No. Telp Supplier",
                                  style: subTitleColorTextstyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: titleColor.withOpacity(0.2),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: controller.telpS,
                                    style: titleColorTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "No. Telp Supplier",
                                      border: InputBorder.none,
                                      hintStyle:
                                          subTitleColorTextstyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                controller.inputProduk(
                                  controller.namaB!.text,
                                  int.parse(controller.stokB!.text),
                                  double.parse(controller.hargaB!.text),
                                  controller.namaS!.text,
                                  controller.alamatS!.text,
                                  controller.telpS!.text,
                                  user.token,
                                );
                              },
                              child: Text(
                                "Simpan",
                                style: subTitleColorTextstyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Close",
                                style: titleColorTextstyle,
                              ),
                            )
                          ],
                        )),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: width * 0.40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: subTitleColor.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: subTitleColor,
                          ),
                          Text(
                            'Add Produk',
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                              color: subTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: GetBuilder<ProdukController>(builder: (c) {
          return FutureBuilder<List<Produk>?>(
              future: c.getProduk(user.token),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Data Kosong'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Produk produk = snapshot.data![index];

                    TextEditingController namaB =
                        TextEditingController(text: produk.namaBarang);
                    TextEditingController hargaB = TextEditingController(
                        text: produk.harga!.toInt().toString());
                    TextEditingController stokB =
                        TextEditingController(text: produk.stok.toString());
                    TextEditingController namaS = TextEditingController(
                        text: produk.supplier!.namaSupplier);
                    TextEditingController alamatS =
                        TextEditingController(text: produk.supplier!.alamat);
                    TextEditingController telpS =
                        TextEditingController(text: produk.supplier!.noTelp);
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) => Container(
                            height: height * 0.37,
                            margin: EdgeInsets.only(
                              top: defaultMargin,
                              left: defaultMargin,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Nama Barang : ${produk.namaBarang}',
                                  style: titleColorTextstyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Harga Barang : ${produk.harga!.toInt().toString()}',
                                  style: titleColorTextstyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Stok Barang : ${produk.stok}',
                                  style: titleColorTextstyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Nama Supplier : ${produk.supplier!.namaSupplier!}',
                                  style: titleColorTextstyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Alamat Supplier : ${produk.supplier!.alamat!}',
                                  style: titleColorTextstyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Telp Supplier : ${produk.supplier!.noTelp!}',
                                  style: titleColorTextstyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Center(
                                          child: AlertDialog(
                                        title: Text(
                                          "Edit Produk",
                                          style: titleColorTextstyle.copyWith(
                                              fontSize: 16),
                                        ),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Nama Suppliers",
                                                style: subTitleColorTextstyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: titleColor
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: namaS,
                                                  style: titleColorTextstyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    // hintText: nama,
                                                    border: InputBorder.none,
                                                    hintStyle:
                                                        subTitleColorTextstyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Asal Suppliers",
                                                style: subTitleColorTextstyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: titleColor
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: alamatS,
                                                  style: titleColorTextstyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    // hintText: jumlah,
                                                    border: InputBorder.none,
                                                    hintStyle:
                                                        subTitleColorTextstyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "No.Telp Suppliers",
                                                style: subTitleColorTextstyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: titleColor
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: telpS,
                                                  style: titleColorTextstyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    // hintText: harga,
                                                    border: InputBorder.none,
                                                    hintStyle:
                                                        subTitleColorTextstyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              //Barang
                                              Text(
                                                "Nama Barang",
                                                style: subTitleColorTextstyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: titleColor
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: namaB,
                                                  style: titleColorTextstyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    // hintText: harga,
                                                    border: InputBorder.none,
                                                    hintStyle:
                                                        subTitleColorTextstyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              Text(
                                                "Harga Barang",
                                                style: subTitleColorTextstyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: titleColor
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: hargaB,
                                                  style: titleColorTextstyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    // hintText: harga,
                                                    border: InputBorder.none,
                                                    hintStyle:
                                                        subTitleColorTextstyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              Text(
                                                "Stok Barang",
                                                style: subTitleColorTextstyle,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: titleColor
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: stokB,
                                                  style: titleColorTextstyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    // hintText: harga,
                                                    border: InputBorder.none,
                                                    hintStyle:
                                                        subTitleColorTextstyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.updateProduk(
                                                // print([
                                                namaB.text,
                                                int.parse(stokB.text),
                                                double.parse(hargaB.text),
                                                namaS.text,
                                                alamatS.text,
                                                telpS.text,
                                                user.token,
                                                produk.id,
                                                produk.supplier!.id,
                                                // ]);
                                              );
                                              Get.back();
                                            },
                                            child: Text(
                                              "Simpan",
                                              style: subTitleColorTextstyle
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {
                                              Get.back();
                                              Get.back();
                                            },
                                            child: Text(
                                              "Close",
                                              style: titleColorTextstyle,
                                            ),
                                          )
                                        ],
                                      )),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(Icons.edit),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Edit Produk",
                                        style: titleColorTextstyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semiBold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Center(
                                            child: Text(
                                              'Hapus',
                                              style:
                                                  titleColorTextstyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          content: Text(
                                            'Apakah anda yakin untuk menghapus ?',
                                            style: subTitleColorTextstyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    Get.back();
                                                    controller.deleteProduk(
                                                      produk.id!,
                                                      user.token,
                                                    );
                                                  },
                                                  child: Text(
                                                    "ya",
                                                    style: titleColorTextstyle
                                                        .copyWith(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                OutlinedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    "tidak",
                                                    style: titleColorTextstyle
                                                        .copyWith(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete, color: primaryColor),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Hapus Produk",
                                        style: titleColorTextstyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semiBold,
                                          color: primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: titleColorTextstyle.copyWith(
                                fontWeight: medium,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          produk.namaBarang!,
                          style: titleColorTextstyle.copyWith(
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Harga : ${produk.harga!.toInt().toString()}',
                          style: subTitleColorTextstyle,
                        ),
                        trailing: Text(
                          'Stok : ${produk.stok!.toString()}',
                          style: subTitleColorTextstyle,
                        ),
                      ),
                    );
                  },
                );
              });
        }),
      );
    }

    return Scaffold(
        body: Column(
      children: [
        header(),
        Expanded(
          child: content(),
        ),
      ],
    ));
  }
}
