import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///  Headings
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),

            ///  Text Field
            TextFormField(
              decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///  Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => ResetPassword()),
                    child: Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}
