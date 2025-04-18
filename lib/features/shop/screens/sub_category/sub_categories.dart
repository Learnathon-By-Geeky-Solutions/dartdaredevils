import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/images/t_rounded_image.dart';
import 'package:grocify/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Fruits'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Banner
              const TRoundedImage(
                width: double.infinity,
                imageurl: TImages.promoBanner2,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  TSectionHeading(
                    title: 'Fruits',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (context, index) => const TProductCartHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
