import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/controllers/checkout_controller.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),

        /// --- Payment Section
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child:  Image(
                  image: AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
