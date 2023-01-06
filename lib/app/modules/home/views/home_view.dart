import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:suppliers_rahmattobi/app/data/models/produk.dart';
import 'package:suppliers_rahmattobi/app/data/models/user.dart';
import 'package:suppliers_rahmattobi/app/routes/app_pages.dart';
import 'package:suppliers_rahmattobi/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  UserModel user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 35,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.profileName!.toUpperCase()}',
                    style: titleColorTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Selamat Datang di Suppliers',
                    style: titleColorTextstyle,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(Routes.login);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget kategori() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 10,
          right: defaultMargin,
          left: defaultMargin,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                          child: AlertDialog(
                        title: Text(
                          "Input Supplier",
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
                                    hintStyle: subTitleColorTextstyle.copyWith(
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
                                    hintStyle: subTitleColorTextstyle.copyWith(
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
                                    hintStyle: subTitleColorTextstyle.copyWith(
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
                              controller.inputSupplier(
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
                    height: 80,
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
                          'Add Supplier',
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
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.produk, arguments: user);
                  },
                  child: Container(
                    height: 60,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: subTitleColor.withOpacity(0.5),
                      //   width: 1,
                      // ),
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Produk',
                          style: titleColorTextstyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "List Suppliers",
              style: titleColorTextstyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget produk() {
      return Container(
        margin: const EdgeInsets.only(
          right: 15,
          left: 15,
        ),
        child: GetBuilder<HomeController>(
          builder: (c) {
            return FutureBuilder<List<Supplier>?>(
              future: c.getSupliers(user.token),
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
                    Supplier supplier = snapshot.data![index];

                    TextEditingController namaS =
                        TextEditingController(text: supplier.namaSupplier);
                    TextEditingController alamatS =
                        TextEditingController(text: supplier.alamat);
                    TextEditingController telpS =
                        TextEditingController(text: supplier.noTelp);
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
                            height: 100,
                            margin: EdgeInsets.only(
                              top: defaultMargin,
                              left: defaultMargin,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Center(
                                          child: AlertDialog(
                                        title: Text(
                                          "Edit Suppliers",
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
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.updateSupplier(
                                                supplier.id,
                                                namaS.text,
                                                alamatS.text,
                                                telpS.text,
                                                user.token,
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
                                        "Edit Supplier",
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
                                                    controller.deleteSuppliers(
                                                      supplier.id!,
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
                                        "Hapus Supplier",
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
                          supplier.namaSupplier!,
                          style: titleColorTextstyle.copyWith(
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          supplier.alamat!,
                          style: subTitleColorTextstyle,
                        ),
                        trailing: Text(supplier.noTelp!),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      );
    }

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        header(),
        const SizedBox(
          height: 10,
        ),
        kategori(),
        Expanded(
          child: produk(),
        ),
      ],
    ));
  }
}
