import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hitoffset/src/Auth/Controller/auth_controller.dart';
import 'package:hitoffset/src/Widgets/inputfield.dart';
import 'package:hitoffset/src/Widgets/mybutton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final authCtrl = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: authCtrl.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Login to your Account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 25),
                    InputField(
                      size: 48,
                      hint: 'Email',
                      borderRadius: 5,
                      icon: Icons.email,
                      color: Colors.white,
                      borderColor: Colors.grey,
                      controller: authCtrl.emailController,
                      type: TextInputType.emailAddress,
                      validator: MultiValidator([
                        RequiredValidator(
                          errorText: 'Password required',
                        ),
                        EmailValidator(
                          errorText: 'Email required',
                        ),
                      ]),
                    ),
                    const SizedBox(height: 15),
                    InputField(
                      size: 48,
                      password: true,
                      borderRadius: 5,
                      hint: 'Password',
                      icon: Icons.lock,
                      color: Colors.white,
                      borderColor: Colors.grey,
                      controller: authCtrl.passwordController,
                      type: TextInputType.visiblePassword,
                      validator: RequiredValidator(
                        errorText: 'Password required',
                      ),
                    ),
                    const SizedBox(height: 15),
                    MyButton(
                      borderRadius: 5,
                      title: 'Login',
                      onTap: authCtrl.signIn,
                    ),
                    const SizedBox(height: 15),
                    // Center(
                    //   child: InkWell(
                    //     onTap: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (ctx) => ForgotPasswordDialog(
                    //           forgotPassword,
                    //         ),
                    //       );
                    //     },
                    //     child: Text(
                    //       translator.getString("login.forgot"),
                    //       style: const TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.black,
                    //         fontFamily: "OpenSans",
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 15),
                    // Center(
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Text(
                    //         translator.getString("login.anyAccount"),
                    //         style: const TextStyle(
                    //           fontSize: 14,
                    //           color: Colors.black,
                    //           fontFamily: "OpenSans",
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //       const SizedBox(width: 10),
                    //       InkWell(
                    //         onTap: () => Navigator.of(context).pushNamed(
                    //           UserSignUpScreen.routName,
                    //         ),
                    //         child: Text(
                    //           translator.getString("login.create"),
                    //           style: const TextStyle(
                    //             fontSize: 14,
                    //             color: Colors.blue,
                    //             fontFamily: "OpenSans",
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            // ElevatedButton(onPressed: () {}, child: Text("data"))
          ],
        )),
      ),
    );
  }
}
