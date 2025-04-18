import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/products/ratings/rating_indicator.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';


class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage2),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        
        
        /// -- Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4 ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Apr 2025', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        const ReadMoreText('The user interface of the app is quite intuitive. I was able to negative and make purchases seamlessly. Great job!',
        trimLines:1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        // company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Grocify's Store", style: Theme.of(context).textTheme.bodyLarge,),
                  Text('02 Apr 2025',style: Theme.of(context).textTheme.bodyMedium,)
                ],
              ),const SizedBox(width: TSizes.spaceBtwItems,),
              const ReadMoreText('The user interface of the app is quite intuitive. I was able to negative and make purchases seamlessly. Great job!',
                trimLines:1,
                trimMode: TrimMode.Line,
                trimExpandedText: ' Show less',
                trimCollapsedText: ' Show more',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
              ),
            ],
          ),),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],

    );
  }
}
