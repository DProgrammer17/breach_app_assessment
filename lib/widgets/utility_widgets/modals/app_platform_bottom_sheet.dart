import 'dart:io';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

abstract class AppPlatformBottomSheet {
  static void showAppBottomModalSheet({
    required BuildContext context,
    required WidgetBuilder content,
    bool showCloseButton = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    double? borderRadius,
    MainAxisSize axisSize = MainAxisSize.min,
  }) {
    if (Platform.isAndroid) {
      showMaterialModalBottomSheet(
        context: context,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: backgroundColor ?? AppColors.overlayGrey.withOpacity(0.5),
        builder: (ctx) => SingleChildScrollView(
          controller: ModalScrollController.of(ctx),
          child: Column(
            mainAxisSize: axisSize,
            children: [
              if (showCloseButton) ...[
                12.sbH,
                InkWell(
                  onTap: ()=> context.popSuper(),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 56.ah,
                      width: 56.aw,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.neutralWhite,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.xmark,
                        size: 18.ar,
                        color: AppColors.grey900,
                      ),
                    ),
                  ),
                ),
                8.sbH,
              ],
              Container(
                constraints: BoxConstraints(
                  maxHeight: AppConstants.deviceHeight * 0.88,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 16.ah,
                  horizontal: 16.aw,
                ),
                decoration: BoxDecoration(
                  color: AppColors.neutralWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular((borderRadius ?? 32).ar),
                  ),
                ),
                child: content.call(context),
              ),
            ],
          ),
        ),
      );
      return;
    }

    showCupertinoModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? AppColors.overlayGrey.withOpacity(0.5),
      builder: (ctx) => Material(
        color: backgroundColor ?? AppColors.overlayGrey.withOpacity(0.5),
        child: Column(
          mainAxisSize: axisSize,
          children: [
            if (showCloseButton) ...[
              12.sbH,
              InkWell(
                onTap: ()=> context.popSuper(),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 56.ah,
                    width: 56.aw,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.neutralWhite,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      CupertinoIcons.xmark,
                      size: 18.ar,
                      color: AppColors.grey900,
                    ),
                  ),
                ),
              ),
              8.sbH,
            ],
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.ah,
                horizontal: 16.aw,
              ),
              constraints: BoxConstraints(
                maxHeight: AppConstants.deviceHeight * 0.8
              ),
              decoration: BoxDecoration(
                color: AppColors.neutralWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular((borderRadius ?? 32).ar),
                ),
              ),
              child: content.call(context),
            ),
          ],
        ),
      ),
    );
  }
}
