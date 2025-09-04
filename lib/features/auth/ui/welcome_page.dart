import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/ui/pick_intrests_page.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_button.dart';
import 'package:breach_assessment/widgets/utility_widgets/empty_appbar.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget{
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_,_)=> false,
      child: AppScaffold(
        appBarContent: EmptyAppBar(),
        body: Stack(
          alignment: Alignment.center,
         children: [
           Image.asset(
             AppAssets.celebrationAnimation,
             height: AppConstants.deviceHeight,
             width: AppConstants.deviceWidth,
             fit: BoxFit.cover,
           ),
           Column(
             children: [
               (AppConstants.deviceHeight * 0.15).sbH,
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(top: 80.ah),
                     child: Image.asset(
                       AppAssets.mascotSpeechBubbleImage,
                       scale: 2,
                     ),
                   ),
                   Image.asset(
                     AppAssets.breachMascotImage,
                     height: 250.ah,
                     width: 180.aw,
                     fit: BoxFit.fitHeight,
                   ),
                 ],
               ),
               32.sbH,
               Text(
                  AppStrings.welcomeToBreach,
                 style: AppTextStyles.h3Inter(
                   context,
                 ).copyWith(fontSize: 30.asp, color: AppColors.grey900),
               ),
               10.sbH,
               Text(
                 AppStrings.fewQuickQuestions,
                 textAlign: TextAlign.center,
                 style: AppTextStyles.body2RegularInter(
                   context,
                 ).copyWith(height: 1.6, color: AppColors.grey900),
               ),
               30.sbH,
               AppButton(
                 onTap: () => context.pushSuper(PickInterestsPage()),
                 title: AppStrings.letsBegin,
                 buttonColor: AppColors.grey900,
               ),
               50.sbH,
             ],
           ),
         ],
        ),),
    );
  }

}