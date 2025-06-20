import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/images/t_circular_image.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/user_controller.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Profile Picture

                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage = controller.profileImageUrl.value;
                        final publicUrl = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.user;
                        return TCircularImage(
                          image: publicUrl,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty,
                        );
                      }),
                      TextButton(
                          onPressed: () =>
                              controller.uploadImageAndSaveUrlToFirebase(),
                          child: const Text('Change Profile Picture')
                      ),
                    ],
                  ),
                ),

                /// -- Details
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                /// -- Heading Profile Info
                const TSectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                Obx(
                      () => TProfileMenu(
                      title: 'Name',
                      value: controller.user.value.fullName,
                      onPressed:() async {
                        final result = await Get.to(() => const ChangeName());
                        if (result == 'updated') {
                          await controller.fetchUserRecord();
                        }
                      },),
                ),
                TProfileMenu(
                  title: 'Username',
                  value: controller.user.value.userName,
                  onPressed: () {},
                ),

                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                /// -- Heading Personal Info
                const TSectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'Gender',
                  value: 'Male',
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'Date of Birth',
                  value: '29 April 2002',
                  onPressed: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                Center(
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
