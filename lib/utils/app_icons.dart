// ignore_for_file: constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  AppIcons._();
  static const AppIconData facebook = AppIconData('ic1', icontype: 'png');
  static const AppIconData google = AppIconData('ic2', icontype: 'png');
  static const AppIconData x = AppIconData('ic3', icontype: 'png');
  static const AppIconData call = AppIconData('call');
  static const AppIconData passlock = AppIconData('passlock');
  static const AppIconData person = AppIconData('person');
  static const AppIconData eye = AppIconData('eye');

  // static const AppIconData x = AppIconData('x', icontype: 'png');
}

@immutable
class AppIconData {
  final String iconpoint;
  final String? icontype;

  const AppIconData(
    this.iconpoint, {
    this.icontype = 'svg',
  });
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    this.shadows,
  }) : super(key: key);

  final AppIconData? icon;
  final double? size;

  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);

    final double? iconSize = size ?? iconTheme.size;

    Color iconColor = color ?? iconTheme.color!;

    Widget iconWidget;
    if (icon!.icontype! == 'png') {
      iconWidget = Image.asset('assets/icons/png/${icon!.iconpoint}.png',
          width: iconSize, height: iconSize);
    } else {
      iconWidget = SvgPicture.asset('assets/icons/svg/${icon!.iconpoint}.svg',
          semanticsLabel: semanticLabel,
          color: iconColor,
          width: iconSize,
          height: iconSize);
    }

    return iconWidget;
  }
}
