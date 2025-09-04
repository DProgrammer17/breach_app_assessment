import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Color? appBarColor;
  final double? height;
  const EmptyAppBar({super.key, this.appBarColor, this.height});

  @override
  Size get preferredSize => const Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      automaticallyImplyLeading: false,
      foregroundColor: appBarColor ?? AppColors.neutralWhite,
      elevation: 0,
      toolbarHeight: height ?? 0,
      backgroundColor: appBarColor ?? AppColors.neutralWhite,
    );
  }

}