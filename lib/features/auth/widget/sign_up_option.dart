import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/utils/enums/entry_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpOption extends ConsumerWidget{
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () =>
          ref.watch(authProvider.notifier).setEntryType(EntryType.signup),
      child: RichText(
        text: TextSpan(
          text: AppStrings.dontHaveAnAccount,
          style: AppTextStyles.body2RegularInter(
            context,
          ).copyWith(color: AppColors.grey900),
          children: [
            TextSpan(
              text: AppStrings.signUp,
              style: AppTextStyles.body2RegularInter(context).copyWith(
                decoration: TextDecoration.underline,
                color: AppColors.grey900,
              ),
            ),
          ],
        ),
      ),
    );
  }

}