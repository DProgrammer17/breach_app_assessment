import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/features/auth/ui/auth_page.dart';
import 'package:breach_assessment/features/home/ui/explore_page.dart';
import 'package:breach_assessment/features/home/ui/home_page.dart';
import 'package:breach_assessment/utils/enums/entry_type.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_button.dart';
import 'package:breach_assessment/widgets/utility_widgets/empty_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntryPage extends ConsumerWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (_,_) => false,
      child: AppScaffold(
        backgroundColor: AppColors.peachWhite,
        appBarContent: EmptyAppBar(),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  ref.watch(authProvider.notifier).setEntryType(EntryType.login);
                  context.pushSuper(AuthPage());
                },
                child: Text(
                  AppStrings.logIn,
                  style: AppTextStyles.h3Inter(context)
                      .copyWith(
                    color: AppColors.primaryPurple700,
                  ),
                ),
              ),
            ),
            12.sbH,
            Image.asset(AppAssets.breachAnimatedLogo, height: AppConstants.deviceWidth * 0.55,),
            12.sbH,
            RichText(
              text: TextSpan(
                text: AppStrings.find,
                style: AppTextStyles.h3Inter(
                  context,
                ).copyWith(height:1.1,fontSize: 70.asp, color: AppColors.grey900),
                children: [
                  TextSpan(
                    text: AppStrings.great,
                    style: AppTextStyles.h3Inter(context).copyWith(
                      color: AppColors.primaryPurple700,
                      fontSize: 85.asp,
                    ),
                  ),
                  TextSpan(
                    text: AppStrings.ideas,
                    style: AppTextStyles.h3Inter(
                      context,
                    ).copyWith(fontSize: 70.asp, color: AppColors.grey900),
                  ),
                ],
              ),
            ),
            20.sbH,
            Text(
              AppStrings.subscribeToYourFavoriteCreators,
              style: AppTextStyles.body4RegularInter(
                context,
              ).copyWith(
                height: 1.4,
                fontWeight: FontWeight.w400,
                  color: AppColors.grey900),
            ),
           const Spacer(),
            AppButton(
              onTap: () {
                ref.watch(authProvider.notifier).setEntryType(EntryType.signup);
                context.pushSuper(AuthPage());
              },
              title: AppStrings.joinBreach,
            ),
            15.sbH,
            Padding(
              padding: EdgeInsets.only(left: 18.aw),
              child: InkWell(
                onTap: ()=> context.pushSuper(ExplorePage()),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.explore,
                      style: AppTextStyles.body4RegularInter(context).copyWith(
                        color: AppColors.grey600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.aw),
                      child: Icon(
                        Icons.chevron_right,
                        size: 22.ar,
                        color: AppColors.grey600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.sbH,
          ],
        ),
      ),
    );
  }
}
