import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/features/home/widget/post_details_tile.dart';
import 'package:breach_assessment/network/api/posts/response/categories_response.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/utility_widgets/tiles/categories_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsPage extends ConsumerWidget {
  final bool scrollable;
  const PostsPage({super.key, this.scrollable = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.grey900,
            indicatorWeight: 1.aw,
            labelColor: AppColors.grey900,
            labelStyle: AppTextStyles.body4RegularGrotesk(
              context,
            ).copyWith(color: AppColors.grey900),
            unselectedLabelColor: AppColors.grey600,
            unselectedLabelStyle: AppTextStyles.body4RegularGrotesk(
              context,
            ).copyWith(color: AppColors.grey600),
            onTap: (page) =>
                ref.watch(homeNotifier.notifier).updatePostTabIndex(page),
            tabs: [
              Tab(text: AppStrings.featured),
              Tab(text: AppStrings.popular),
              Tab(text: AppStrings.recent),
            ],
          ),
          18.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.aw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.filter,
                      style: AppTextStyles.body2RegularGrotesk(
                        context,
                      ).copyWith(color: AppColors.grey900),
                    ),
                    10.sbW,
                    CategoriesInfoTile(
                      category:
                          ref.watch(homeNotifier).selectedCategory ??
                          CategoriesResponse(
                            id: 769,
                            icon: '🌐',
                            name: AppStrings.all,
                          ),
                      selected: false,
                      action: () {},
                    ),
                  ],
                ),
                InkWell(
                  onTap: ()=> ref.watch(homeNotifier.notifier).showCategoriesModal(context: context),
                  child: Icon(
                    Icons.filter_list,
                    size: 22.ar,
                    color: AppColors.primaryPurple600,
                  ),
                ),
              ],
            ),
          ),
          24.sbH,
          Expanded(
            child: ListView.separated(
              physics: scrollable ? const BouncingScrollPhysics(): const NeverScrollableScrollPhysics(),
              itemCount: ref.watch(homeNotifier).posts.length,
              itemBuilder: (_, index) {
                final post = ref.watch(homeNotifier).posts.elementAt(index);
                return PostDetailsTile(post: post);
              }, separatorBuilder: (_, int index) {
                return Column(
                  children: [
                    8.sbH,
                    Divider(thickness: 1.aw, color: AppColors.grey300,),
                    8.sbH,
                  ],
                );
            },
            ),
          ),
        ],
      ),
    );
  }
}
