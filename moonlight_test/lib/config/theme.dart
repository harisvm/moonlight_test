import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///standard material design guidelines are used here
///custom font used - poppins
class AppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      accentColor: AppColors.red,
      bottomAppBarColor: AppColors.lightGray,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.purpleLightHome),
          textTheme: theme.textTheme.copyWith(
              caption: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400))),
      textTheme: theme.textTheme
          .copyWith(


        ///headline5
        headline5: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal),
        ///headline6
        headline6: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w500),
        ///subtitle1
        subtitle1: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w500),
        ///subtitle2
        subtitle2: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500),

        ///body 1
        bodyText1: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 0.5,
            fontWeight: FontWeight.normal),
        ///body 2
        bodyText2: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            letterSpacing: 0.25,
            fontWeight: FontWeight.normal),
        ///button
        button: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 1.25,
            fontWeight: FontWeight.w500),


      )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}


///colors
class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFFD9D9D9);
  static const darkGray = Color(0xFF979797);
  static const darkerGray = Color(0xFF808080);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const backgroundLight2 = Color(0xFFF7F7F7);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF1AD900);
  static const green = Color(0xFF3A7328);
  static const lightGreen = Color(0xFFADD8E6);
  static const cyan = Color(0xFF2DACA7);

  static const purpleDark = Color(0xFF200B53);
  static const purple = Color(0xFF490A9E);
  static const purpleLight = Color(0xFF9C6ECE);
  static const purpleLight1 = Color(0xFFDFD1FB);
  static const purpleLight2 = Color(0xFFE0E0F4);
  static const purpleLightHome = Color(0xFF4A09A0);
  static const purpleShadow = Color(0xFFEFF0FB);
}