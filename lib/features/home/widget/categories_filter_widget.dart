import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/utility_widgets/tiles/categories_info_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesFilterWidget extends ConsumerWidget {
  const CategoriesFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.sbH,
        Text(
          AppStrings.categories,
          style: AppTextStyles.h3Inter(
            context,
          ).copyWith(fontSize: 30.asp, color: AppColors.grey900),
        ),
        3.sbH,
        Text(
          AppStrings.discoverContentFromTopics,
          style: AppTextStyles.body2RegularGrotesk(context),
        ),
        16.sbH,
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () => ref.watch(homeNotifier.notifier).clearCategoryFilter(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.clear,
                  style: AppTextStyles.h3Inter(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryPurple700,
                  ),
                ),
                6.sbW,
                Padding(
                  padding: EdgeInsets.only(top: 2.aw),
                  child: Icon(
                    CupertinoIcons.xmark,
                    size: 16.ar,
                    color: AppColors.primaryPurple700,
                  ),
                ),
              ],
            ),
          ),
        ),
        24.sbH,
        SingleChildScrollView(
          child: Wrap(
            spacing: 10.aw,
            runSpacing: 10.ah,
            children: List.generate(ref.watch(homeNotifier).categories.length, (
              index,
            ) {
              final category = ref
                  .watch(homeNotifier)
                  .categories
                  .elementAt(index);
              return CategoriesInfoTile(
                category: category,
                selected:
                    ref.read(homeNotifier).selectedCategory?.id == category.id,
                action: () => ref
                    .watch(homeNotifier.notifier)
                    .updateCategoryFilter(context: context, category: category),
              );
            }),
          ),
        ),
        32.sbH,
      ],
    );
  }
}
