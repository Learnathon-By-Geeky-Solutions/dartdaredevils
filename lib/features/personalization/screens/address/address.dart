import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/features/personalization/controllers/address_controller.dart';
import 'package:grocify/features/personalization/screens/address/add_new_address.dart';
import 'package:grocify/features/personalization/screens/address/widgets/single_address.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/cloud_helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),

      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Address', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(
            () =>  FutureBuilder(
            key: Key(controller.refreshData.value.toString()),
           future: controller.getAllUserAddresses(),
            builder: (context, snapshot) {

             final response =TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
             if(response != null) return response;

             final addresses = snapshot.data!;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) =>  TSingleAddress( address: addresses[index], onTap: () => controller.selectAddress(addresses[index]),),
              );
            }
          ),
        ),),
      ),
    );
  }
}
