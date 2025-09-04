import 'package:breach_assessment/network/api/base/base_error.dart';
import 'package:breach_assessment/network/exceptions/ground_exception.dart';
import 'package:breach_assessment/network/exceptions/object_parse_exception.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

Either<BaseError, E> transform<E>(
    dynamic data, E Function(dynamic) transformer) {
  try {
    return Right(transformer(data));
  } on BaseError catch (e) {
    return Left(e);
  } on TypeError {
    return Left(ObjectParseException());
  } on Exception catch (e) {
    return Left(GroundException(e.toString()));
  }
}

Either<BaseError, E> transformObject<E>(
    dynamic data, E Function(Object) transformer) {
  try {
    return Right(transformer(data));
  } on BaseError catch (e) {
    return Left(e);
  } on TypeError {
    return Left(ObjectParseException());
  } on Exception catch (e) {
    return Left(GroundException(e.toString()));
  }
}

Either<BaseError, E> processData<E>(
  E Function(dynamic) transformer,
  Either<BaseError, Response?> response,
) {
  if (response.isLeft) return Left(response.left);

  try {
    final transformed = transformer(response.right!.data);
    return Right(transformed);
  } catch (e, stack) {
    print('${e.toString()}''\n${stack.toString()}');
    return Left(BaseError(
      message: e.toString(),
      statusCode: response.right?.statusCode,
    ));
  }
}
