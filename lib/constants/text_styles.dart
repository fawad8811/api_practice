import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle f24W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: h * 0.0295,
      color: color,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f16W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: h * 0.0197,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f14W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height / 812;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 14 * h,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f8W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 8,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f11W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height / 812;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 11 * h,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f18W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height / 812;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 18 * h,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f12W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height / 812;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 12 * h,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f20W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: h * 0.0246,
      color: color,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f28W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height / 812;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 28 * h,
      color: color,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f34W400(BuildContext context, {Color? color, bool? isUnderline, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 34,
      color: color,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle f50W400(BuildContext context, {Color? color, bool? isUnderlin, FontWeight? fontWeight, double? letterSpacing, String? fontFamily}) {
    var h = MediaQuery.of(context).size.height / 812;
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: 50 * h,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? 'PlayfairFont',
      decoration: isUnderlin == true ? TextDecoration.underline : TextDecoration.none,
    );
  }
}
