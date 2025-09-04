import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/features/auth/ui/entry_page.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/features/home/widget/drawer_option_tile.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/utility_widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: AppConstants.deviceWidth - 100.aw,
      padding: EdgeInsets.symmetric(horizontal: 24.aw),
      color: AppColors.neutralWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (AppConstants.deviceHeight * 0.08).sbH,
          Image.asset(AppAssets.breachLogo, height: 20.ah),
          40.sbH,
          AppButton(
            width: 250.aw,
            title: AppStrings.startWriting,
            prefixButtonIcon: SvgPicture.asset(
              SvgAssets.writingIcon,
              height: 20.ah,
            ),
          ),
          40.sbH,
          Column(
            spacing: 8.ah,
            children: List.generate(
              3,
              (index) => DrawerOptionTile(
                id: index,
                icon: ref.watch(homeNotifier).drawerIcons.elementAt(index),
                title: ref.watch(homeNotifier).drawerOptions.elementAt(index),
                selected: ref.watch(homeNotifier).selectedDrawerOption == index,
              ),
            ),
          ),
          8.sbH,
          DrawerOptionTile(
            id: 4,
            icon: '',
            leadingIcon: Icon(
              Icons.delete,
              size: 22.ar,
              color: AppColors.baseRed,
            ),
            title: AppStrings.logout,
            textColor: AppColors.baseRed,
            selected: false,
            onTap: ()=> ref.watch(homeNotifier.notifier).logoutActions(context),
          ),
        ],
      ),
    );
  }
}
