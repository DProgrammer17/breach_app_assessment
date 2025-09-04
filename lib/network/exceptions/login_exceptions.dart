import 'package:breach_assessment/network/exceptions/api_exception.dart';

class CompleteSecondOnboardException extends ApiException {
  CompleteSecondOnboardException(this.exception);

  final String exception;

  String get errorMessage => exception;
}

class CompleteVerifyOTPException extends ApiException {
  CompleteVerifyOTPException(this.exception);

  final String exception;

  String get errorMessage => exception;
}

class CompleteTransactionPINException extends ApiException {
  CompleteTransactionPINException(this.exception);

  final String exception;

  String get errorMessage => exception;
}

class InvalidDeviceException extends ApiException {
  InvalidDeviceException(this.exception);

  final String exception;

  String get errorMessage => exception;
}

class CompleteBusinessInfoException extends ApiException {
  CompleteBusinessInfoException(this.exception);

  final String exception;

  String get errorMessage => exception;
}

class CompleteBusinessDocsException extends ApiException {
  CompleteBusinessDocsException(this.exception);

  final String exception;

  String get errorMessage => exception;
}

class CompleteBusinessDirectorsException extends ApiException {
  CompleteBusinessDirectorsException(this.exception);

  final String exception;

  String get errorMessage => exception;
}
