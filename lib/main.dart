import 'package:breach_assessment/breach_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize(); //
  runApp(ProviderScope(child: const BreachApp()));
}

