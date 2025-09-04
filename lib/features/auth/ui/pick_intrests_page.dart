import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/features/home/ui/home_page.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_back_button.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_button.dart';
import 'package:breach_assessment/widgets/utility_widgets/tiles/categories_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickInterestsPage extends ConsumerStatefulWidget {
  const PickInterestsPage({super.key});

  @override
  ConsumerState<PickInterestsPage> createState() => _PickInterestsPageState();
}

class _PickInterestsPageState extends ConsumerState<PickInterestsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).getCategories(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isLoading: ValueNotifier(ref.watch(authProvider).isLoading),
      appBarContent: AppBackButton(),
      body: Column(
        children: [
          32.sbH,
          Image.asset(
            AppAssets.smirkingMascotImage,
            height: 100.ah,
            width: 100.aw,
          ),
          12.sbH,
          Text(
            AppStrings.whatAreYourInterests,
            style: AppTextStyles.h3Inter(
              context,
            ).copyWith(fontSize: 24.asp, color: AppColors.grey900),
          ),
          10.sbH,
          Text(
            AppStrings.selectYourInterests,
            textAlign: TextAlign.center,
            style: AppTextStyles.body2RegularInter(
              context,
            ).copyWith(height: 1.6, color: AppColors.grey900),
          ),
          40.sbH,
          SizedBox(
            height: AppConstants.deviceHeight * 0.43,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10.aw,
                runSpacing: 10.ah,
                children: List.generate(ref.watch(authProvider).categories.length, (
                  index,
                ) {
                  final category = ref
                      .watch(authProvider)
                      .categories
                      .elementAt(index);
                  return CategoriesInfoTile(
                    category: category,
                    selected: ref
                        .read(authProvider)
                        .selectedInterests
                        .any((e) => e.id == category.id),
                    action: () =>
                        ref.watch(authProvider.notifier).addInterests(category),
                  );
                }),
              ),
            ),
          ),
          30.sbH,
          AppButton(
            isDisabled: ValueNotifier(ref.watch(authProvider).interestsDisabled),
            onTap: () => ref.watch(authProvider.notifier).postUserInterests(context),
            title: AppStrings.next,
            buttonColor: AppColors.grey900,
          ),
          12.sbH,
          InkWell(
          onTap: ()=> context.pushAndPopAllSuper(HomePage()),
            child: Text(
              AppStrings.skipForLater,
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(color: AppColors.grey700),
            ),
          ),
          20.sbH,
        ],
      ),
    );
  }
}
