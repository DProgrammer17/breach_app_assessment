import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/features/home/widget/top_post_tile.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/page_widgets/no_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPickTile extends ConsumerWidget {
  const TopPickTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      shape: Border(), // Removes expanded border
      collapsedShape: Border(),
      tilePadding: EdgeInsets.zero,
      initiallyExpanded: true,
      title: Text(
        AppStrings.topPicks,
        style: AppTextStyles.h1Inter(
          context,
        ).copyWith(fontSize: 28.asp, color: AppColors.grey900),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 3.ah),
        child: Text(
          AppStrings.experienceTheBestOfBranch,
          style: AppTextStyles.body4RegularInter(context).copyWith(),
        ),
      ),
      children: [
        18.sbH,
        Builder(
          builder: (_) {
            if (ref.watch(homeNotifier).posts.isEmpty) {
              return NoDataPage(
                title: ErrorStrings.oops,
                subtitle: ErrorStrings.noPostAvailable,
                showButton: true,
                buttonAction: () {},
                buttonTitle: AppStrings.refresh,
              );
            }
            return TopPostTile(post: ref.watch(homeNotifier).posts.first);
          },
        ),
      ],
    );
  }
}
