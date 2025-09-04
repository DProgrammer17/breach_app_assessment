import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/network/api/posts/response/posts_response.dart';
import 'package:breach_assessment/utils/extensions/date_time_extensions.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/utility_widgets/app_network_image.dart';
import 'package:flutter/material.dart';

class PostDetailsTile extends StatelessWidget{
  final PostsResponse post;
  const PostDetailsTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppNetworkImage(image: post.imageUrl ?? '', height: 84.ah, width: 84.aw, radius: 16.ar,),
        16.sbW,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200.aw,
              child: Text(
                (post.series?.name ?? AppStrings.na).toUpperCase(),
                style: AppTextStyles.body1RegularInter(context).copyWith(),
              ),
            ),
            8.sbH,
            SizedBox(
              width: 260.aw,
              child: Text(
                post.title ?? AppStrings.na,
                style: AppTextStyles.h5Inter(context).copyWith(
                  height: 1.3,
                  color: AppColors.grey900,
                ),
              ),
            ),
            8.sbH,
            SizedBox(
              width: 260.aw,
              child: Text(
                post.content ?? AppStrings.na,
                style: AppTextStyles.body2RegularInter(context).copyWith(
                  height: 1.4,
                  color: AppColors.grey600,
                ),
              ),
            ),
            10.sbH,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  (post.author?.name ?? AppStrings.na).toUpperCase(),
                  style: AppTextStyles.body2RegularInter(context).copyWith(
                    fontSize: 11.asp,
                    color: AppColors.grey900,
                  ),
                ),
                8.sbW,
                Container(
                  height: 4.ah,
                  width: 4.aw,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey900,
                  ),
                ),
                8.sbW,
                Text(
                  (post.createdAt ?? DateTime.now()).dayMonthYearFormat.toUpperCase(),
                  style: AppTextStyles.body2RegularInter(context).copyWith(
                    fontSize: 11.asp,
                    color: AppColors.grey900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

}