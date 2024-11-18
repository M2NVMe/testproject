import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/RegularControllers/logincontrol.dart';
import 'package:testproject/Controllers/RegularControllers/registercontrol.dart';
import 'package:testproject/Reuses/myButton.dart';
import 'package:testproject/Reuses/myTextfield.dart';

class Registerutama extends StatelessWidget {
  Registerutama({super.key});

  final RegisterController Controller = Get.put(RegisterController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController full_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()), // Spacer at the top
          myTextField(
            hintText: 'username',
            isObscure: false,
            textStyle: const TextStyle(fontSize:20),
            rad: 8,
            controller: usernameController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          myTextField(
            hintText: 'password',
            isObscure: true,
            textStyle: const TextStyle(fontSize: 20),
            rad: 8,
            controller: passwordController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 25),
          myTextField(
            hintText: 'full name',
            isObscure: false,
            textStyle: const TextStyle(fontSize: 20),
            rad: 8,
            controller: full_name,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 25),
          myTextField(
            hintText: 'email',
            isObscure: false,
            textStyle: const TextStyle(fontSize: 20),
            rad: 8,
            controller: email,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 25),
          Expanded(child: Container()),
          Obx(() => myButton(
            textButton: const Text("Register"),
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            radius: 8,
            elevation: 0,
            onPressed: Controller.isLoading.value
                ? null
                : () {
              Controller.handleRegister(
                  usernameController, passwordController, full_name, email);
            },
          ),),
          myButton(
            textButton: const Text("Login"),
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            radius: 8,
            elevation: 0,
            onPressed: () {Get.toNamed('/');},
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
