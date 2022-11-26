import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signIn() async {
    if (formKey.currentState!.validate()) {
      // FocusScope.of(context).unfocus();
      // await Future.delayed(const Duration(milliseconds: 100));
      // context.loaderOverlay.show();
      // Provider.of<AuthProvider>(context, listen: false)
      //     .signIn(
      //   emailController.text,
      //   passwordController.text,
      // )
      //     .then((value) {
      //   context.loaderOverlay.hide();
      //   if (value == "4") {
      //     Navigator.of(context).popUntil((route) => route.isFirst);
      //     Navigator.of(context).pushReplacementNamed(
      //       DashboardScreen.routName,
      //     );
      //   } else {
      //     Utils.showErroMessage(
      //       context,
      //       translator.getString("code$value"),
      //     );
      //   }
      // });
      debugPrint('login successfull');
      Fluttertoast.showToast(msg: 'Login successful');
    }
  }
}
