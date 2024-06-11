import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hala_meet/utils/app_colors.dart';

import '../linker.dart';
// import 'package:nb_utils/nb_utils.dart';

class CustomWidget {
  static Text text7(String data,
      {Key? key,
      TextStyle? style,
      TextAlign? textAlign,
      Color? color,
      double? fontSize}) {
    return Text(data,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ));
  }

  /// Semi-bold
  static Text text6(
    String data, {
    Key? key,
    TextStyle? style,
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return Text(data,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ));
  }

  /// Normal / regular / plain
  static Text text4(
    String data, {
    Key? key,
    TextStyle? style,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return Text(data,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ));
  }

  /// Light
  static Text text3(
    String data, {
    Key? key,
    TextStyle? style,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return Text(data,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
        ));
  }

  /// Medium
  static Text text5(
    String data, {
    Key? key,
    TextStyle? style,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return Text(data,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ));
  }

  Widget textFieldandTitle(BuildContext context,
      {required TextEditingController controller,
      TextFieldType textFieldType = TextFieldType.NAME,
      dynamic Function(String)? onFieldSubmitted,
      FocusNode? focus,
      String? errorThisFieldRequired,
      String? title,
      TextInputAction? textInputAction,
      FocusNode? nextFocus,
      int? maxLines,
      int? minLines,
      int? maxLength,
      bool optional = true,
      String? hint,
      AppIconData? prefixIcon,
      Widget? suffixIcon,
      String? Function(dynamic value)? validator}) {
    const iconBoxConstraints = BoxConstraints(maxWidth: 35, minHeight: 24);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Row(
            children: [
              CustomWidget.text4(title, color: textSecondaryColorGlobal),
              if (optional == false)
                CustomWidget.text5(
                  '  (Optional)',
                )
            ],
          ),
        AppTextField(
          textFieldType: textFieldType,
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          minLines: minLines,
          focus: focus,
          nextFocus: nextFocus,
          validator: validator,
          textInputAction: textInputAction,
          isValidationRequired: optional,
          errorThisFieldRequired: errorThisFieldRequired,
          onFieldSubmitted: onFieldSubmitted,

          //TODO THIS ICON WAS NOT AVAILABLE
          suffixPasswordVisibleWidget: icon(
            AppIcons.passlock,
          ),
          suffixPasswordInvisibleWidget: icon(
            AppIcons.eye,
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIconConstraints: iconBoxConstraints,
            suffixIconConstraints: iconBoxConstraints,
            prefixIcon: prefixIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [icon(prefixIcon), 10.width],
                  )
                : null,
            contentPadding: EdgeInsets.zero,
            suffixIcon: suffixIcon,
            border: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.secondaryblackColor,
            )),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.secondaryblackColor,
            )),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.primaryColor,
            )),
          ),
        ),
        20.height,
      ],
    );
  }

  AppIcon icon(AppIconData icon) {
    return AppIcon(
      icon,
      size: 22,
      color: textSecondaryColorGlobal,
    );
  }
}

class AppBars {
  final BuildContext context;

  AppBars(
    this.context,
  );

  AppBar backAndTitleOnly({String? title, bool chev = true, nolead = false}) {
    return AppBar(
      leading: !nolead
          ? Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: context.primaryColor,
                  size: 30,
                ),
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      leadingWidth: 40,
      centerTitle: false,
      elevation: 0,
      title: title != null ? CustomWidget.text7(title) : null,
    );
  }
}
