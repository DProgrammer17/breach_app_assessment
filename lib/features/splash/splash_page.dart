import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/features/splash/notifier/spalsh_page_notifier.dart';
import 'package:breach_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:breach_assessment/widgets/utility_widgets/empty_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashProvider.notifier).navigation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarContent: EmptyAppBar(),
      body: Center(child: Image.asset(AppAssets.breachLogo)),
    );
  }
}
