import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/login_signup/form_divider.dart';
import 'package:grocify/common/widgets/login_signup/social_buttons.dart';
import 'package:grocify/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:grocify/utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///   Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///  Form
              TSignupForm(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Divider
              TFromDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Social Button
              TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
