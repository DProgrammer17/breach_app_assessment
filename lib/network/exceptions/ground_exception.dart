import 'package:breach_assessment/network/api/base/base_error.dart';

class GroundException extends BaseError {
  final String exception;
  GroundException(this.exception);

  @override
  String get message => exception;
}
