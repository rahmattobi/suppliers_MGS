import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:suppliers_rahmattobi/theme.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/supplies.json',
              height: 200,
            ),
            const SizedBox(
              height: 20,
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
            // key: authC.registKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Create your account',
                    style: titleColorTextstyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
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
                          child: TextField(
                            controller: controller.nameC,
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Profile Name',
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
                        ),
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
                          child: TextField(
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
                                  //     ? Icons.visibility
                                  // : Icons.visibility_off,
                                  color: Colors.grey,
                                  Icons.visibility,
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
                InkWell(
                  onTap: () {
                    if (controller.nameC!.text != '' &&
                        controller.usernameC!.text != '' &&
                        controller.passC!.text != '') {
                      controller.register(
                        controller.nameC!.text,
                        controller.usernameC!.text,
                        controller.passC!.text,
                      );
                    } else {
                      Get.snackbar(
                        "Error",
                        "Semua Data Harus Terisi",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'SIGN UP',
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
              'Already have account?',
              style: subTitleColorTextstyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Login',
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
      resizeToAvoidBottomInset: false,
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
