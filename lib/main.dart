import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/firebase_options.dart';
import 'package:qaf_store/qaf_app.dart';
import 'package:qaf_store/utils/constants/constants.dart';
import 'package:qaf_store/utils/constants/shared_preference_keys.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/local_storage/shared_preferences.dart';
import 'package:qaf_store/utils/routings/app_router.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  checkIfUserLoggedIn();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QafApp(appRouter: AppRouter()));
}

checkIfUserLoggedIn() async {
  Constants.userKey =
      await SharedPreference.getString(SharedPreferenceKey.userUidKey);
  if (!Constants.userKey.isNullOrEmpty()) {
    isLoggedUser = true;
  } else
    isLoggedUser = false;
}
