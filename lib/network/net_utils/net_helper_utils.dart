import 'dart:convert';

abstract class NetHelperUtils{
  static String formatValue(dynamic value) => value is Map ? jsonEncode(value) : value.toString();
}