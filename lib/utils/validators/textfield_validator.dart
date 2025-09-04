import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/utils/validators/string_regex.dart';

abstract class TextFieldValidator{
  /// validates the TextField that receives the email
  static String? email(String? value) {
    if (value != null) {
      final isValid = RegExp(StringRegex.email).hasMatch(value);
      if (!isValid) return ErrorStrings.invalidEmail;
    }
    return null;
  }

  /// validates the TextField that receives the password
  static String? password(String? value) {
    if (value != null) {
      final upperCase = RegExp(StringRegex.passUpperCase).hasMatch(value);
      final lowerCase = RegExp(StringRegex.passLowerCase).hasMatch(value);
      final symbol = RegExp(StringRegex.passSymbol).hasMatch(value);
      final digits = RegExp(StringRegex.passNumber).hasMatch(value);
      final min8char = RegExp(StringRegex.pass8Chars).hasMatch(value);

      if (!digits) return 'Must have a number';
      if (!upperCase) return 'Must have an upper case letter';
      if (!lowerCase) return 'Must have a lower case letter';
      if (!symbol) return 'Must have a symbol';
      if (!min8char) return 'Must have at least 8 characters';
    }
    return null;
  }
}