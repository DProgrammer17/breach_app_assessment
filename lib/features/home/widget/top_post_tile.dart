import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/network/api/posts/response/posts_response.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/utility_widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPostTile extends ConsumerWidget {
  final PostsResponse post;
  const TopPostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppNetworkImage(
          image: post.imageUrl ?? '',
          height: AppConstants.deviceHeight * (ref.watch(homeNotifier).interests.isEmpty ? 0.2 : 0.25),
          width: double.infinity,
          radius: 16.ar,
        ),
        14.sbH,
        Text(
          post.title ?? AppStrings.na,
          style: AppTextStyles.h3Grotesk(context).copyWith(
            fontSize: 24.asp,
            color: AppColors.grey900,
          ),
        ),
        10.sbH,
        Text(
          post.content ?? AppStrings.na,
          style: AppTextStyles.body4RegularInter(context).copyWith(
            height: 1.4,
            color: AppColors.grey600,
          ),
        ),
      ],
    );
  }
}
