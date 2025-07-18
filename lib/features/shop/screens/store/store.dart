import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/appbar/tabbar.dart';
import 'package:grocify/common/widgets/brands/brand_card.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:grocify/common/widgets/layouts/grid_layout.dart';
import 'package:grocify/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:grocify/common/widgets/shimmers/brands_shimmer.dart';
import 'package:grocify/features/shop/controllers/brand_controller.dart';
import 'package:grocify/features/shop/controllers/category_controller.dart';
import 'package:grocify/features/shop/screens/brand/all_brands.dart';
import 'package:grocify/features/shop/screens/brand/brand_products.dart';
import 'package:grocify/features/shop/screens/store/widget/category_tab.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/texts/section_heading.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key, });



  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
         TCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(

            /// --- Header
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          const TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),

                          /// --- Featured Brands
                          TSectionHeading(
                            title: 'Feature Brands',
                            showActionButton: true,
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen()),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          Obx(() {
                            if(brandController.isLoading.value) return const TBrandsShimmer();

                            if(brandController.featuredBrands.isEmpty){
                              return Center(
                                child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                              );
                            }

                          return  TGridLayout(
                                itemCount: brandController.featuredBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand = brandController.featuredBrands[index];

                                  return  TBrandCard(
                                    onTap:  () => Get.to(() => BrandProducts(brand: brand)),
                                    showBorder: true, brand: brand,
                                  );
                                });
                          })
                        ],
                      ),
                    ),

                    /// Tabs---

                    bottom: TTabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList(),
                    )),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => TCategoryTab(
                          category: category,
                        ))
                    .toList())),
      ),
    );
  }
}
