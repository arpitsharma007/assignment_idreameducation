import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customDialog(
    {double? borderRadius,
      Widget? content,
      Widget? title,
      EdgeInsetsGeometry? contentPadding,
      EdgeInsetsGeometry? titlePadding = EdgeInsets.zero,
      List<Widget>? actions,
      Widget? displayUnderLogo,
      Color? backgroundColor = Colors.white,
      EdgeInsets? insetPadding,
      bool? scrollable = true}) {
  return AlertDialog(
    title: title,
    titlePadding: titlePadding,
    contentPadding: contentPadding ?? EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10),
    backgroundColor: backgroundColor!,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5))),
    content: content,
    actions: actions,
    buttonPadding: EdgeInsets.zero,
    scrollable: scrollable ?? true,
    insetPadding: insetPadding ??
        EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10),
  );
}