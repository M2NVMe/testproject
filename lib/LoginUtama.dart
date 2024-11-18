import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/RegularControllers/logincontrol.dart';
import 'package:testproject/Reuses/myButton.dart';
import 'package:testproject/Reuses/myTextfield.dart';

class Loginutama extends StatelessWidget {
  Loginutama({super.key});

  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()), // Spacer at the top
          myTextField(
            hintText: 'username',
            isObscure: false,
            textStyle: const TextStyle(fontSize: 10),
            rad: 8,
            controller: usernameController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          myTextField(
            hintText: 'password',
            isObscure: true,
            textStyle: const TextStyle(fontSize: 10),
            rad: 8,
            controller: passwordController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 25),
          Expanded(child: Container()), // Spacer at the bottom
          Obx(() => myButton(
            textButton: const Text("Login"),
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            radius: 8,
            elevation: 0,
            onPressed: loginController.isLoading.value
                ? null
                : () {
              loginController.LoggerIn(
                  usernameController, passwordController);
            },
          )),
          myButton(
            textButton: const Text("Register"),
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            radius: 8,
            elevation: 0,
            onPressed: () {Get.toNamed('/2');},
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
