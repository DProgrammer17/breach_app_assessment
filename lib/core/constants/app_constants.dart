import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

///global uuid generation function;
String uuid= Uuid().v4();

abstract class AppConstants{
  static const size = _SizeConstant();
  static double designWidth = 402;
  static double designHeight = 874;

  static double get deviceWidth {
    return ScreenUtil().screenWidth;
  }

  static double get deviceHeight {
    return ScreenUtil().screenHeight;
  }

}

class _SizeConstant {
  const _SizeConstant();
  static const double _storyBarRadius = 22;
  static const double _toolBarHeight = 45;
  static const double _tileBorderRadius = 12;
  static const double _lowerBoarderRadius = 16;
  static const double _horizontalPadding = 20;

  double get storyBarRadius => _storyBarRadius.ar;
  double get toolBarHeight => _toolBarHeight.ah;
  double get tileBorderRadius => _tileBorderRadius.ar;
  double get lowerBoarderRadius => _lowerBoarderRadius.ar;
  double get horizontalPadding => _horizontalPadding.ar;
}

extension SizeExtension on num {
  double get aw => w;
  double get ah => h;
  double get ar => r;
  double get asp => sp;
}