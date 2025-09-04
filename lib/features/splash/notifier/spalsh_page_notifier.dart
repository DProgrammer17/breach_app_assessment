import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/services/app_storage.dart';
import 'package:breach_assessment/features/auth/ui/entry_page.dart';
import 'package:breach_assessment/features/home/ui/explore_page.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = NotifierProvider<SplashPageNotifier, bool>(
      () => SplashPageNotifier(),
);

class SplashPageNotifier extends Notifier<bool> {
  @override
  build() => true;

  void navigation(BuildContext context) async {
    bool loggedIn = await AppStorage.getBoolPref(ConfigStrings.loggedIn);
    Future.delayed(
      Duration(milliseconds: 800),
      () {
        if(loggedIn){
          context.pushAndPopAllSuper(ExplorePage());
          return;
        }
        context.pushAndPopAllSuper(EntryPage());
      },
    );
  }
}
