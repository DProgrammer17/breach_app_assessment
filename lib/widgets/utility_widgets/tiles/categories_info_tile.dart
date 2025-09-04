import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/network/api/posts/response/categories_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesInfoTile extends ConsumerWidget {
  final CategoriesResponse category;
  final bool selected;
  final VoidCallback action;
  const CategoriesInfoTile({
    super.key,
    required this.category,
    required this.action,
    required this.selected,
  });

  @override
  Widget build(BuildContext context, WidgetRef) {
    return InkWell(
      onTap: action,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 9.ah, horizontal: 16.aw),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.ar),
          color: selected ? AppColors.primaryPurple600 : AppColors.neutralWhite,
          border: Border.all(width: 1.aw, color: AppColors.softText),
        ),
        child: RichText(
          text: TextSpan(
            text: '${category.icon ?? ''}  ',
            style: AppTextStyles.body2RegularInter(
              context,
            ).copyWith(color: AppColors.grey900),
            children: [
              TextSpan(
                text: category.name ?? '',
                style: AppTextStyles.body2RegularInter(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: selected ? AppColors.neutralWhite : AppColors.grey900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
