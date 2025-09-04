import 'package:breach_assessment/core/constants/app_assets.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/network/api/intrests/response/interest_response.dart';
import 'package:breach_assessment/network/api/posts/response/categories_response.dart';
import 'package:breach_assessment/network/api/posts/response/posts_response.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeVm {
  final GlobalKey<ScaffoldState> homeScaffoldKey;
  final int selectedDrawerOption;
  final List<String> drawerIcons;
  final List<String> drawerOptions;
  final List<CategoriesResponse> categories;
  final List<PostsResponse> posts;
  final List<PostsResponse> newsStream;
  final List<InterestResponse> interests;
  final CategoriesResponse? selectedCategory;
  final WebSocketChannel? channel;
  final int postTabIndex;
  final int homeTabIndex;
  final bool isLoading;
  final bool connectedSocket;

  const HomeVm({
    required this.homeScaffoldKey,
    this.selectedDrawerOption = 0,
    this.postTabIndex = 0,
    this.homeTabIndex = 0,
    this.drawerIcons = const [
      SvgAssets.homeIcon,
      SvgAssets.dashboardIcon,
      SvgAssets.publicationIcon,
    ],
    this.drawerOptions = const [
      AppStrings.home,
      AppStrings.dashboard,
      AppStrings.publications,
    ],
    this.interests = const [],
    this.categories = const [],
    this.posts = const [],
    this.newsStream = const [],
    this.isLoading = false,
    this.connectedSocket = true,
    this.selectedCategory,
    this.channel,
  });

  HomeVm copyWith({
    GlobalKey<ScaffoldState>? homeScaffoldKey,
    int? selectedDrawerOption,
    int? postTabIndex,
    int? homeTabIndex,
    List<String>? drawerIcons,
     List<String>? drawerOptions,
    List<CategoriesResponse>? categories,
    List<PostsResponse>? posts,
    List<PostsResponse>? newsStream,
    List<InterestResponse>? interests,
    bool? isLoading,
    bool? connectedSocket,
    CategoriesResponse? Function()? selectedCategory,
    WebSocketChannel? Function()? channel,
  }) {
    return HomeVm(
      isLoading: isLoading ?? this.isLoading,
      homeScaffoldKey: homeScaffoldKey ?? this.homeScaffoldKey,
      selectedDrawerOption: selectedDrawerOption ?? this.selectedDrawerOption,
      categories: categories ?? this.categories,
      posts: posts ?? this.posts,
      newsStream: newsStream ?? this.newsStream,
      interests: interests ?? this.interests,
      postTabIndex: postTabIndex ?? this.postTabIndex,
      homeTabIndex: homeTabIndex ?? this.homeTabIndex,
      connectedSocket: connectedSocket ?? this.connectedSocket,
      drawerIcons: drawerIcons ?? this.drawerIcons,
      drawerOptions: drawerOptions ?? this.drawerOptions,
      selectedCategory: selectedCategory != null ? selectedCategory() : this.selectedCategory,
      channel: channel != null ? channel() : this.channel,
    );
  }
}
