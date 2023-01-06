import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.asset(
              'assets/lottie/supplies.json',
              height: 200,
            ),
            Text(
              'Suppliers',
              style: primTextstyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Suppliers merupakan sebuah aplikasi pengelola stok produk untuk penjualan',
                  style: subTitleColorTextstyle,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_user.png',
                          width: 24,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.usernameC,
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Username',
                              hintStyle: subTitleColorTextstyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_pass.png',
                          width: 24,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.passC,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              hintStyle: subTitleColorTextstyle.copyWith(
                                fontSize: 16,
                              ),
                              suffix: const InkWell(
                                // onTap: _togglePasswordView,
                                child: Icon(
                                  // _isHidden
                                  // ? Icons.visibility
                                  // : Icons.visibility_off,
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (controller.usernameC!.text != '' &&
                            controller.passC!.text != '') {
                          controller.login(controller.usernameC!.text,
                              controller.passC!.text);
                        } else {
                          Get.snackbar(
                            "Error",
                            "Semua Data Harus Terisi",
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: Text(
                        'SIGN IN',
                        style: primTextstyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account?',
              style: subTitleColorTextstyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.register);
              },
              child: Text(
                ' SIGN UP',
                style: primTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          Expanded(
            child: content(),
          ),
          footer(),
        ],
      ),
    );
  }
}
