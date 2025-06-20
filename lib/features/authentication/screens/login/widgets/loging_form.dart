import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/features/authentication/controllers/login/login_controller.dart';
import 'package:grocify/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:grocify/features/authentication/screens/signup/signup.dart';
import 'package:grocify/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLogingForm extends StatelessWidget {
  const TLogingForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: TTexts.email,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///     Password
              PasswordField(controller: controller),

              const SizedBox(
                height: TSizes.spaceBtwInputFields / 4,
              ),

              /// Remember Me & forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                          !controller.rememberMe.value)),
                      const Text(TTexts.rememberMe),
                    ],
                  ),

                  /// Forget Password
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: const Text(TTexts.forgetPassword))
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(TTexts.signIn),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: const Text(TTexts.createAccount),
                ),
              )
            ],
          ),
        ));
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => TextFormField(
        controller: controller.password,
        validator: (value) => TValidator.validatePassword(value),
        obscureText: controller.hidePassword.value,
        decoration: InputDecoration(
          labelText: TTexts.password,
          prefixIcon: const Icon(Iconsax.password_check),
          suffixIcon: IconButton(
              onPressed: () => controller.hidePassword.value =
              !controller.hidePassword.value,
              icon: Icon(controller.hidePassword.value
                  ? Iconsax.eye_slash
                  : Iconsax.eye)),
        ),
      ),
    );
  }
}
