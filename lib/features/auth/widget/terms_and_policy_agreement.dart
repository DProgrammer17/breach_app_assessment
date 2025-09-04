import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:flutter/material.dart';

class TermsAndPolicyAgreement extends StatelessWidget{
  const TermsAndPolicyAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: AppStrings.bySigningUp,
        style: AppTextStyles.body2RegularGrotesk(
          context,
        ).copyWith(height: 1.6,color: AppColors.grey600),
        children: [
          TextSpan(
            text: AppStrings.terms,
            style: AppTextStyles.body2RegularGrotesk(context).copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primaryPurple600,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: AppStrings.ampersand,
            style: AppTextStyles.body2RegularGrotesk(
              context,
            ).copyWith(color: AppColors.grey600),
          ),
          TextSpan(
            text: AppStrings.privacyPolicy,
            style: AppTextStyles.body2RegularGrotesk(context).copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primaryPurple600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

}