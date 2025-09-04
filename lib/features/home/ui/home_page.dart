import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/constants/app_textsyles.dart';
import 'package:breach_assessment/features/auth/state/auth_notifier.dart';
import 'package:breach_assessment/features/home/state/home_notifier.dart';
import 'package:breach_assessment/features/home/ui/home_posts_page.dart';
import 'package:breach_assessment/features/home/ui/stream_page.dart';
import 'package:breach_assessment/features/home/widget/drawer_widget.dart';
import 'package:breach_assessment/utils/extensions/widget_extensions.dart';
import 'package:breach_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with AutomaticKeepAliveClientMixin {
  final bool _keepAlive = true;

  @override
  bool get wantKeepAlive => _keepAlive;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifier.notifier).initActions(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: PopScope(
        onPopInvokedWithResult: (_, _) => false,
        child: AppScaffold(
          scaffoldKey: ref.watch(homeNotifier).homeScaffoldKey,
          isLoading: ValueNotifier(ref.watch(homeNotifier).isLoading),
          toolbarHeight: 90.ah,
          appBarContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.breachLogo, scale: 1.8,),
              10.sbH,
              InkWell(
                onTap: ()=>  ref.watch(homeNotifier).homeScaffoldKey.currentState?.openDrawer(),
                child: Icon(
                  Icons.menu,
                  size: 22.ar,
                  color: AppColors.grey900,
                ),
              ),
            ],
          ),
          drawer: DrawerWidget(),
          appBarBottomContent: TabBar(
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
              Tab(text: AppStrings.posts),
              Tab(text: AppStrings.streams),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.ah),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
                children: [HomePostPage(), StreamPage()]),
          ),
        ),
      ),
    );
  }
}
