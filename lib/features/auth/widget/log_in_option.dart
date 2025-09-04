import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/utils/enums/entry_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInOption extends ConsumerWidget {
  const LogInOption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () =>
          ref.watch(authProvider.notifier).setEntryType(EntryType.login),
      child: RichText(
        text: TextSpan(
          text: AppStrings.alreadyHaveAnAccount,
          style: AppTextStyles.body2RegularInter(
            context,
          ).copyWith(color: AppColors.grey900),
          children: [
            TextSpan(
              text: AppStrings.logIn,
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
