import 'dart:convert';

import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/services/app_storage.dart';
import 'package:breach_assessment/core/services/websocket_service.dart';
import 'package:breach_assessment/features/auth/ui/entry_page.dart';
import 'package:breach_assessment/features/home/state/home_vm.dart';
import 'package:breach_assessment/features/home/widget/categories_filter_widget.dart';
import 'package:breach_assessment/network/api/base/base_error.dart';
import 'package:breach_assessment/network/api/intrests/interests_api.dart';
import 'package:breach_assessment/network/api/posts/posts_api.dart';
import 'package:breach_assessment/network/api/posts/request/posts_query.dart';
import 'package:breach_assessment/network/api/posts/response/categories_response.dart';
import 'package:breach_assessment/network/api/posts/response/posts_response.dart';
import 'package:breach_assessment/network/net_utils/api_path.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/widgets/utility_widgets/modals/app_platform_bottom_sheet.dart';
import 'package:breach_assessment/widgets/utility_widgets/snackbar/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final homeNotifier = NotifierProvider<HomeNotifier, HomeVm>(
  () => HomeNotifier(),
);

class HomeNotifier extends Notifier<HomeVm> {
  @override
  HomeVm build() => HomeVm(homeScaffoldKey: GlobalKey<ScaffoldState>());

  bool drawerOptionSelected(int id) => state.selectedDrawerOption == id;

  void updateDrawerOption({required BuildContext context, required int id}) {
    state = state.copyWith(selectedDrawerOption: id);
    //  context.popSuper();
  }

  void updatePostTabIndex(int index) =>
      state = state.copyWith(postTabIndex: index);
  void updateHomeTabIndex(int index) =>
      state = state.copyWith(homeTabIndex: index);

  ///Category Filter Methods
  void updateCategoryFilter({
    required BuildContext context,
    required CategoriesResponse category,
  }) {
    state = state.copyWith(selectedCategory: () => category);
    Future.delayed(const Duration(milliseconds: 200), () {
      if (context.mounted) {
       getPosts(context);
      }
    });
  }

  void clearCategoryFilter(BuildContext context) {
    state = state.copyWith(selectedCategory: () => null);
    Future.delayed(const Duration(milliseconds: 200), () {
      if (context.mounted) {
        getPosts(context);
      }
    });
  }

  void showCategoriesModal({required BuildContext context}) async {
    ///Open replies bottom sheet
    return AppPlatformBottomSheet.showAppBottomModalSheet(
      context: context,
      axisSize: MainAxisSize.max,
      enableDrag: false,
      content: (context) => CategoriesFilterWidget(),
    );
  }

  void logoutActions(BuildContext context) async{
    context.pushAndPopAllSuper(EntryPage());
    await AppStorage.setBoolPrefs(key: ConfigStrings.loggedIn, value: false);
    await AppStorage.setStringPrefs(
      key: ConfigStrings.authToken,
      value: '',
    );
    await AppStorage.setIntPrefs(
      key: ConfigStrings.userId,
      value: 0,
    );
  }

  Future<void> initActions(BuildContext context) async {
    getCategories(context);
    getPosts(context);
    getInterests(context);
  }

  ///APP GET CATEGORIES CALL
  Future<void> getCategories(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await PostsApi.getCategories();

      ///Populate Categories List
      state = state.copyWith(isLoading: false, categories: response.categories);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
  }

  ///APP GET POSTS CALL
  Future<void> getPosts(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await PostsApi.getPosts(
        PostsQuery(categoryId: state.selectedCategory?.id),
      );

      ///Populate Posts List
      state = state.copyWith(isLoading: false, posts: response.posts);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
  }

  ///API GET INTERESTS CALL
  Future<void> getInterests(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);
      final userId = await AppStorage.getIntPref(ConfigStrings.userId);
      final response = await InterestsApi.getInterests(
        authToken: authToken,
        userId: userId,
      );

      ///Populate Posts List
      state = state.copyWith(isLoading: false, interests: response.interests);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
  }


  ///Websocket Methods
  /// Initialize websocket service once
  final _webSocketService = WebSocketService();


  void initWebSocket(BuildContext context) {
    bool connected = false;
    _webSocketService.isConnected = (connection) {
      connected = connection;
      state = state.copyWith(connectedSocket: connection);
    };

    ///Notification on successful connection
    AppMessages.showSuccessMessage(
      context: context,
      message: AppStrings.socketConnected,
    );

    _webSocketService.onMessage = (data) {
      state = state.copyWith(
        newsStream: state.newsStream.toList()
          ..insert(0, PostsResponse.fromJson(jsonDecode(data))),
      );

      if(state.newsStream.length >5){
        state.newsStream.removeLast();
      }
    };

    _webSocketService.onDisconnected = () {
      AppMessages.showInfoMessage(
        context: context,
        message: AppStrings.socketClosed,
      );
    };

    _webSocketService.onError = (error) {
      AppMessages.showInfoMessage(
        context: context,
        message: error.toString(),
      );
    };

    _webSocketService.connect(context: context);
  }
}
