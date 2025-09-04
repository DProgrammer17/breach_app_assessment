import 'package:breach_assessment/network/api/posts/response/categories_response.dart';
import 'package:breach_assessment/utils/enums/entry_type.dart';
import 'package:flutter/material.dart';

class AuthVM {
  final GlobalKey<FormState> authFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final bool isLoading;
  final bool isDisabled;
  final bool interestsDisabled;
  final EntryType entryType;
  final List<CategoriesResponse> categories;
  final List<CategoriesResponse> selectedInterests;

  const AuthVM({
    required this.authFormKey,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    this.entryType = EntryType.signup,
    this.isLoading = false,
    this.isDisabled = true,
    this.interestsDisabled = true,
    this.categories =  const[],
    this.selectedInterests =  const[],
  });

  AuthVM copyWith({
    GlobalKey<FormState>? authFormKey,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    EntryType? entryType,
    FocusNode? emailFocusNode,
    FocusNode? passwordFocusNode,
    bool? isLoading,
    bool? isDisabled,
    bool? interestsDisabled,
    List<CategoriesResponse>? categories,
    List<CategoriesResponse>? selectedInterests,
  }) {
    return AuthVM(
      isLoading: isLoading ?? this.isLoading,
      isDisabled: isDisabled ?? this.isDisabled,
      interestsDisabled: interestsDisabled ?? this.interestsDisabled,
      authFormKey: authFormKey ?? this.authFormKey,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      emailFocusNode: emailFocusNode ?? this.emailFocusNode,
      passwordFocusNode: passwordFocusNode ?? this.passwordFocusNode,
      entryType: entryType ?? this.entryType,
      categories: categories ?? this.categories,
      selectedInterests: selectedInterests ?? this.selectedInterests,
    );
  }
}
