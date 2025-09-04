import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/utils/enums/snackbar_type.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:flutter/cupertino.dart';

class AppSnackBarTile extends StatelessWidget {
  final String message;
  final SnackBarType type;
  const AppSnackBarTile({super.key, required this.message, required this.type});

  IconData icon(SnackBarType method) {
    switch (method) {
      case SnackBarType.error:
        return CupertinoIcons.xmark_circle;

      case SnackBarType.info:
        return CupertinoIcons.info;

      case SnackBarType.success:
        return CupertinoIcons.check_mark_circled;
    }
  }

  Color iconColor(SnackBarType method) {
    switch (method) {
      case SnackBarType.error:
        return AppColors.failRed;

      case SnackBarType.info:
        return AppColors.primaryPurple600;

      case SnackBarType.success:
        return AppColors.onlineGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.aw),
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: BorderRadius.circular(4.ar),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon(type),
            size: 23.ar,
            color: iconColor(type),
          ),
          16.sbW,
          SizedBox(
            width: 220.aw,
            child: Text(
              message,
              style: AppTextStyles.h3Inter(
                context,
              ).copyWith(fontSize: 14.asp, color: AppColors.textGrey2),
            ),
          ),
          const Spacer(),
          Icon(CupertinoIcons.xmark, size: 19.ar, color: AppColors.textGrey2),
        ],
      ),
    );
  }
}
