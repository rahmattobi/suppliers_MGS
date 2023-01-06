import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/master_supplier_controller.dart';

class MasterSupplierView extends GetView<MasterSupplierController> {
  const MasterSupplierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MasterSupplierView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MasterSupplierView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
