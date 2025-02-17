import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/qaf_app.dart';
import 'package:qaf_store/utils/routing/app_router.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(QafApp(appRouter: AppRouter()));
}
