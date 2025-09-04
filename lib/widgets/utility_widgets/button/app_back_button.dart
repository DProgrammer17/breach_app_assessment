import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final double? size;
  final VoidCallback? onTap;
  final Color? color;
  const AppBackButton({super.key, this.size, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.popSuper(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.chevron_back,
            size: size ?? 17.ar,
            color: color ?? AppColors.grey900,
          ),
          10.sbW,
          Text(
            AppStrings.back,
            style: AppTextStyles.h5Inter(context).copyWith(
              color: AppColors.grey900,
            ),
          ),
        ],
      ),
    );
  }
}
