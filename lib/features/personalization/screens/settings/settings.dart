import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:grocify/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:grocify/common/widgets/list_tile/user_profile_tile.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/personalization/controllers/user_controller.dart';
import 'package:grocify/features/personalization/screens/address/address.dart';
import 'package:grocify/features/personalization/screens/profile/profile.dart';
import 'package:grocify/features/shop/screens/cart/cart.dart';
import 'package:grocify/features/shop/screens/order/order.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  --- Header

            TPrimaryHeaderContainer(
                child: Column(
              children: <Widget>[
                //  --- AppBar
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                // --- UserProfileCard

                TUserProfileTile(
                  onPressed: () async {
                    // Navigate to ProfileScreen
                    await Get.to(() => const ProfileScreen());
                    // Update the user data after coming back to SettingsScreen
                    UserController.instance.fetchUserRecord();
                    UserController.instance.fetchUserProfileImage();
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),
            // --- Body

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of al the discounted coupons',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase'),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'BDLocation ',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode ',
                    subTitle: 'Search result is safe for all aes',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality ',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// --- Logout Button
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            controller.logoutAccountWarningPopup(),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
