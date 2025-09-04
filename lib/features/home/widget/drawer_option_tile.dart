import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerOptionTile extends ConsumerWidget {
  final int id;
  final String icon;
  final String title;
  final bool selected;
  final Color? textColor;
  final Color? iconColor;
  final Widget? leadingIcon;
  final VoidCallback? onTap;
  const DrawerOptionTile({
    super.key,
    required this.id,
    required this.icon,
    required this.title,
    required this.selected,
    this.textColor,
    this.iconColor,
    this.leadingIcon,
    this.onTap,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: (){
        if(onTap != null){
          onTap!.call();
          return;
        }
        ref.watch(homeNotifier.notifier).updateDrawerOption(context: context, id: id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 12.aw),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.ar),
          color: selected ? AppColors.faintPurple : AppColors.neutralWhite,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leadingIcon ?? SvgPicture.asset(
              icon,
              height: 20.ah,
              width: 20.aw,
              color: selected ? AppColors.primaryPurple600 : (iconColor ?? AppColors.grey500),
            ),
            12.sbW,
            Text(
              title,
              style: AppTextStyles.body4RegularInter(context).copyWith(
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400 ,
                color: selected ? AppColors.primaryPurple600 : (textColor ?? AppColors.grey500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
