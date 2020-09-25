import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
//                  fontFamily: GoogleFonts.poppins(),
                  fontWeight: FontWeight.w400))),
      textTheme: theme.textTheme
          .copyWith(
        //over image white text
        /* headline: theme.textTheme.headline.copyWith(
                fontSize: 48,
                color: AppColors.white,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w900),

            title: theme.textTheme.title.copyWith(
                fontSize: 24,
                color: AppColors.black,
                fontWeight: FontWeight.w900,
                fontFamily: 'Metropolis'),*/

        //headline5
        headline5: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal),
        //headline6
        headline6: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w500),
        //subtitle1
        subtitle1: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w500),
        //subtitle2
        subtitle2: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500),

        //body 1
        bodyText1: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 0.5,
            fontWeight: FontWeight.normal),
        //body 2
        bodyText2: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            letterSpacing: 0.25,
            fontWeight: FontWeight.normal),
        //button
        button: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 1.25,
            fontWeight: FontWeight.w500),

        /* display2: theme.textTheme.display2.copyWith(
                fontFamily: 'Metropolis', fontWeight: FontWeight.w400),
            //product price
            display3: theme.textTheme.display3.copyWith(
                color: AppColors.lightGray,
                fontSize: 14,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),
            display4: theme.textTheme.display4.copyWith(
                fontFamily: 'Metropolis', fontWeight: FontWeight.w500),

            subtitle: theme.textTheme.headline.copyWith(
                fontSize: 18,
                color: AppColors.black,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),
            subhead: theme.textTheme.headline.copyWith(
                fontSize: 24,
                color: AppColors.darkGray,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500),
            //red button with white text
            button: theme.textTheme.button.copyWith(
                fontSize: 14,
                color: AppColors.white,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500),
            //black caption title
            caption: theme.textTheme.caption.copyWith(
                fontSize: 34,
                color: AppColors.black,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w700),
            //light gray small text
            body1: theme.textTheme.body1.copyWith(
                color: AppColors.lightGray,
                fontSize: 11,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),
            //view all link
            body2: theme.textTheme.body2.copyWith(
                color: AppColors.black,
                fontSize: 11,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400),*/
      )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}
class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);

//  static const purple = Color(0xFF5E25B0);
  static const purpleDark = Color(0xFF200B53);
  static const purple = Color(0xFF490A9E);
  static const purpleLight = Color(0xFF9C6ECE);
  static const purpleLight1 = Color(0xFFDFD1FB);
  static const purpleLight2 = Color(0xFFE0E0F4);
  static const purpleLightHome = Color(0xFF4A09A0);
  static const purpleShadow = Color(0xFFEFF0FB);
}