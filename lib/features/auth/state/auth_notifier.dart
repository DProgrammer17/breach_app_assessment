import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/services/app_storage.dart';
import 'package:breach_assessment/features/auth/state/auth_vm.dart';
import 'package:breach_assessment/features/auth/ui/welcome_page.dart';
import 'package:breach_assessment/features/home/ui/home_page.dart';
import 'package:breach_assessment/network/api/auth/auth_api.dart';
import 'package:breach_assessment/network/api/auth/requests/auth_request.dart';
import 'package:breach_assessment/network/api/base/base_error.dart';
import 'package:breach_assessment/network/api/intrests/interests_api.dart';
import 'package:breach_assessment/network/api/intrests/request/post_interest_request.dart';
import 'package:breach_assessment/network/api/posts/posts_api.dart';
import 'package:breach_assessment/network/api/posts/response/categories_response.dart';
import 'package:breach_assessment/utils/enums/entry_type.dart';
import 'package:breach_assessment/utils/extensions/navigation.dart';
import 'package:breach_assessment/widgets/utility_widgets/snackbar/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthVM>(
  () => AuthNotifier(),
);

class AuthNotifier extends Notifier<AuthVM> {
  @override
  build() => AuthVM(
    authFormKey: GlobalKey<FormState>(),
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    emailFocusNode: FocusNode(),
    passwordFocusNode: FocusNode(),
  );

  void clearAndDispose(){
    ///Clear Actions
    state.emailController.clear();
    state.passwordController.clear();
  }

  void setEntryType(EntryType type) => state = state.copyWith(entryType: type);

  void enableButton() {
    if (state.authFormKey.currentState!.validate() &&
        state.emailController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty) {
      state = state.copyWith(isDisabled: false);
      return;
    }
    state = state.copyWith(isDisabled: true);
  }

  void enableInterestsButton() {
    if (state.selectedInterests.isNotEmpty) {
      state = state.copyWith(interestsDisabled: false);
      return;
    }
    state = state.copyWith(interestsDisabled: true);
  }

  void validateAuthAction(BuildContext context) {
    if (state.emailController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty) {
      ///Perform Login Call
      if (state.entryType == EntryType.login) {
        validateLoginCall(context);
        return;
      }

      ///Perform Signup Call
      signUpCall(context);
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseFillAllFields,
    );
  }

  ///APP SIGNUP API CALL
  Future<void> signUpCall(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await AuthApi.signUp(
        request: AuthRequest(
          email: state.emailController.text,
          password: state.passwordController.text,
        ),
      );

      state = state.copyWith(isLoading: false);
      await AppStorage.setBoolPrefs(key: ConfigStrings.loggedIn, value: true);
      await AppStorage.setStringPrefs(
        key: ConfigStrings.authToken,
        value: response.token ?? '',
      );
      await AppStorage.setIntPrefs(
        key: ConfigStrings.userId,
        value: response.userId ?? 0,
      );

      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.success,
        );
        clearAndDispose();
        context.pushReplacementSuper(WelcomePage());
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

  ///APP LOGIN API CALL
  Future<void> validateLoginCall(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await AuthApi.login(
        request: AuthRequest(
          email: state.emailController.text,
          password: state.passwordController.text,
        ),
      );

      state = state.copyWith(isLoading: false);
      await AppStorage.setBoolPrefs(key: ConfigStrings.loggedIn, value: true);
      await AppStorage.setStringPrefs(
        key: ConfigStrings.authToken,
        value: response.token ?? '',
      );
      await AppStorage.setIntPrefs(
        key: ConfigStrings.userId,
        value: response.userId ?? 0,
      );

      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.success,
        );
        clearAndDispose();
        context.pushAndPopAllSuper(HomePage());
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

  ///APP POST USER INTERESTS CALL
  Future<void> postUserInterests(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);
      final userId = await AppStorage.getIntPref(ConfigStrings.userId);
      await InterestsApi.postUserInterests(
        authToken: authToken,
        userId: userId,
        request: PostInterestRequest(interests: state.selectedInterests.map((e)=> e.id!).toList()),
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.success,
        );
        context.pushAndPopAllSuper(HomePage());
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

  void addInterests(CategoriesResponse category) {
    List<CategoriesResponse> interimInterests = state.selectedInterests
        .toList();

    if (!state.selectedInterests.any((e) => e.id == category.id)) {
      interimInterests = interimInterests.toList()..add(category);
      state = state.copyWith(selectedInterests: interimInterests);
      enableInterestsButton();
      return;
    }

    ///Remove interest if it already exists in the selected list
    removeInterests(category);
    enableInterestsButton();
    return;
  }

  void removeInterests(CategoriesResponse category) {
    List<CategoriesResponse> interimList = state.selectedInterests.toList();
    interimList = interimList..removeWhere((e) => e.id == category.id);
    state = state.copyWith(selectedInterests: interimList);

    enableInterestsButton();
  }
}
