import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/products/cart/coupon_widget.dart';
import 'package:grocify/common/widgets/success_screen/success_screen.dart';
import 'package:grocify/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:grocify/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:grocify/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:grocify/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:grocify/navigation_menu.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            ' Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// --- Items in Cart
                TCartItems(
                  showAddRemoveButtons: false,
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// --- Coupon TextField
                TCouponCode(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// --- Billing Section

                TRoundedContainer(
                  showBorder: true,
                  padding: EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: Column(
                    children: [
                      /// --- Pricing
                      TBillingAmountSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// --- Divider
                      Divider(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// ---Payment Methods
                      TBillingPaymentSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// --- Address Section

                      TBillingAddressSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(() => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subTitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.offAll(() => NavigationMenu()),
                  )),
              child: Text(' Checkout \$48.00')),
        ));
  }
}
