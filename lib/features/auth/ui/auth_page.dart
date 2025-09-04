import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/features/auth/ui/welcome_page.dart';
import 'package:breach_assessment/features/auth/widget/log_in_option.dart';
import 'package:breach_assessment/features/auth/widget/sign_up_option.dart';
import 'package:breach_assessment/features/auth/widget/terms_and_policy_agreement.dart';
import 'package:breach_assessment/utils/enums/entry_type.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/utils/validators/textfield_validator.dart';
import 'package:breach_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_back_button.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_button.dart';
import 'package:breach_assessment/widgets/utility_widgets/textfield/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      isLoading: ValueNotifier(ref.watch(authProvider).isLoading),
      appBarContent: AppBackButton(),
      body: Form(
        key: ref.watch(authProvider).authFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            24.sbH,
            Text(
              ref.watch(authProvider).entryType == EntryType.signup ?  AppStrings.joinBreach : AppStrings.logIn,
              style: AppTextStyles.h3Inter(
                context,
              ).copyWith(fontSize: 32.asp, color: AppColors.grey900),
            ),
            10.sbH,
            Text(
              AppStrings.authSubText,
              textAlign: TextAlign.center,
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(height: 1.6, color: AppColors.grey900),
            ),
            32.sbH,
            AppTextfield(
              showOuterTile: true,
              outerTitle: AppStrings.email,
              horizontalPadding: 0,
              controller: ref.watch(authProvider).emailController,
              hintText: AppStrings.emailHint,
              inputType: TextInputType.emailAddress,
              validator: (email) => TextFieldValidator.email(email),
              onChanged: (value)=> ref.watch(authProvider.notifier).enableButton(),
            ),
            24.sbH,
            AppTextfield(
              showOuterTile: true,
              outerTitle: AppStrings.password,
              horizontalPadding: 0,
              controller: ref.watch(authProvider).passwordController,
              hintText: AppStrings.passwordHint,
              validator: (password) => TextFieldValidator.password(password),
              onChanged: (value)=> ref.watch(authProvider.notifier).enableButton(),
            ),
            50.sbH,
            AppButton(
              width: double.infinity,
              isDisabled: ValueNotifier(ref.watch(authProvider).isDisabled),
              onTap: () => ref.watch(authProvider.notifier).validateAuthAction(context),
              title: AppStrings.continueText,
              buttonColor: AppColors.grey900,
            ),
            24.sbH,
            ref.watch(authProvider).entryType == EntryType.signup
                ? LogInOption()
                : SignUpOption(),
            if (ref.watch(authProvider).entryType == EntryType.signup) ...[
              Spacer(),
              TermsAndPolicyAgreement(),
            ],
            80.sbH,
          ],
        ),
      ),
    );
  }
}
