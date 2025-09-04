import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/utils/extensions/string_extensions.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showButton;
  final String? buttonTitle;
  final VoidCallback? buttonAction;
  const NoDataPage({
    super.key,
    required this.title,
    this.subtitle,
    this.showButton = false,
    this.buttonTitle,
    this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutralWhite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(LottieAssets.noDataFoundAnimation, height: 100.ah),
            32.sbH,
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.h1Grotesk(
                context,
              ).copyWith(fontSize: 22.asp),
            ),
            if (subtitle.isNotBlank) ...[
              10.sbH,
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppTextStyles.body2RegularGrotesk(
                  context,
                ).copyWith(height: 1.6, color: AppColors.grey600),
              ),
            ],
            if (showButton) ...[
              32.sbH,
              AppButton(onTap: buttonAction, title: buttonTitle!),
            ],
            80.sbH,
          ],
        ),
      ),
    );
  }
}
