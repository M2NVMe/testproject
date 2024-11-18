import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/registerapi.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var registStatus = "".obs;
  var token = "".obs;

  final Registerapi registerapi = Registerapi();

  Future<void> register(
      String username, String password, String fullName, String email) async {
    isLoading.value = true;
    try {
      final response = await registerapi.register(username, password, fullName, email);

      if (response["status"] == true) {
        registStatus.value = "Registration success";
      } else {
        registStatus.value = "Registration failed: ${response["message"]}";
      }
    } catch (e) {
      registStatus.value = "Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }

  //ini fungsinya, biar ga ribet di uinya
  Future<void> handleRegister(
      TextEditingController usernameController,
      TextEditingController passwordController,
      TextEditingController fullNameController,
      TextEditingController emailController,
      ) async {
    if (isLoading.value) return;

    final username = usernameController.text;
    final password = passwordController.text;
    final fullName = fullNameController.text;
    final email = emailController.text;

    if (username.isEmpty || password.isEmpty || fullName.isEmpty || email.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    await register(username, password, fullName, email);

    if (registStatus.value == "Registration success") {
      Get.snackbar("Account Created", registStatus.value);
    } else {
      Get.snackbar("Error", registStatus.value);
    }
  }
}
