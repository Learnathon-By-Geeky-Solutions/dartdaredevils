import 'package:flutter/material.dart';
import 'package:grocify/utils/theme/custom_theme/appbar_theme.dart';
import 'package:grocify/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:grocify/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:grocify/utils/theme/custom_theme/chip_theme.dart';
import 'package:grocify/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:grocify/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:grocify/utils/theme/custom_theme/text_field_theme.dart';
import 'package:grocify/utils/theme/custom_theme/text_theme.dart';

import 'custom_theme/custom_color.dart';


class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    extensions: [TCustomColor.lightCustomColorExtension],
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black54,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    extensions: [TCustomColor.darkCustomColorExtension],
  );


}