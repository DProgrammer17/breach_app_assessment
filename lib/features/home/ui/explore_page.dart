import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/features/auth/ui/auth_page.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/features/home/widget/posts_page.dart';
import 'package:breach_assessment/utils/enums/entry_type.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_back_button.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     ref.read(homeNotifier.notifier).getCategories(context);
     ref.read(homeNotifier.notifier).getPosts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, _) => false,
      child: AppScaffold(
        isLoading: ValueNotifier(ref.watch(homeNotifier).isLoading),
        centerTile: false,
        toolbarHeight: 70.ah,
        appBarContent: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppAssets.breachLogo, scale: 1.8,),
            const Spacer(),
            InkWell(
              onTap: () {
                ref.watch(authProvider.notifier).setEntryType(EntryType.login);
                context.pushSuper(AuthPage());
              },
              child: Text(
                AppStrings.logIn,
                style: AppTextStyles.h3Inter(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryPurple700,
                ),
              ),
            ),
            14.sbW,
            AppButton(
              verticalPadding: 0,
              horizontalPadding: 10.aw,
              onTap: () {
                ref.watch(authProvider.notifier).setEntryType(EntryType.signup);
                context.pushSuper(AuthPage());
              },
              title: AppStrings.joinBreach,
              titleStyle: AppTextStyles.body2RegularInter(context).copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.neutralWhite,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.ah),
          child: PostsPage(),
        ),
      ),
    );
  }
}
