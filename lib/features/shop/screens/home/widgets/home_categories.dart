import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/images_text_widgets/vertical_image_text.dart';
import 'package:grocify/features/shop/screens/sub_category/sub_categories.dart';
import 'package:grocify/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageText(image: TImages.beveragesIcon,title: 'Beverage',onTap: () => Get.to(() => const SubCategoriesScreen()),);
          }),
    );
  }
}