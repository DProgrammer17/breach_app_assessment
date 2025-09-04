import 'package:intl/intl.dart';

extension DateToStringExtension on DateTime {
  String get dayMonthYearFormat => DateFormat('dd MMMM yyyy').format(this);
}