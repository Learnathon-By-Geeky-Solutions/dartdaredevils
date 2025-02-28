import 'package:flutter/material.dart';
import 'package:grocify/utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkerGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    offset: const Offset(0, 2)
  );

      static final horizontalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      offset: const Offset(0, 2)
  );
}