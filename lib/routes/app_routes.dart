import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:grocify/features/authentication/screens/login/login.dart';
import 'package:grocify/features/authentication/screens/onboarding/onboarding.dart';
import 'package:grocify/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:grocify/features/authentication/screens/signup/signup.dart';
import 'package:grocify/features/authentication/screens/signup/verify_email.dart';
import 'package:grocify/features/personalization/screens/address/address.dart';
import 'package:grocify/features/personalization/screens/profile/profile.dart';
import 'package:grocify/features/personalization/screens/settings/settings.dart';
import 'package:grocify/features/shop/screens/cart/cart.dart';
import 'package:grocify/features/shop/screens/checkout/checkout.dart';
import 'package:grocify/features/shop/screens/home/home.dart';
import 'package:grocify/features/shop/screens/order/order.dart';
import 'package:grocify/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:grocify/features/shop/screens/store/store.dart';
import 'package:grocify/features/shop/screens/wishlist/wishlist.dart';
import 'package:grocify/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
