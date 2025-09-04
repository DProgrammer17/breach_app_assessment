import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/ui/pick_intrests_page.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/features/home/widget/posts_page.dart';
import 'package:breach_assessment/features/home/widget/top_picks_tile.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePostPage extends ConsumerWidget {
  const HomePostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.watch(homeNotifier.notifier).initActions(context),
      child: Column(
        children: [
          if (ref.watch(homeNotifier).interests.isEmpty) ...[
            ListTile(
              onTap: () => context.pushSuper(PickInterestsPage()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.ar),
                side: BorderSide(
                  width: 1.aw,
                  color: AppColors.primaryPurple600,
                )
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 9.aw),
              title: Text(
                AppStrings.setUpUserInterests,
                style: AppTextStyles.h3Inter(
                  context,
                ).copyWith(color: AppColors.grey900),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 3.ah),
                child: Text(
                  AppStrings.selectYourInterests,
                  style: AppTextStyles.body1RegularInter(
                    context,
                  ).copyWith(height: 1.4),
                ),
              ),
              trailing: Icon(
                CupertinoIcons.chevron_right,
                size: 22.ar,
                color: AppColors.primaryPurple600,
              ),
            ),
            18.sbH,
          ],
          TopPickTile(),
          18.sbH,
          Expanded(child: PostsPage()),
        ],
      ),
    );
  }
}
