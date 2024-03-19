import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/getx/bindings/bindings.dart';
import 'package:job_studio_profile_ui/helpers/get_storage_helper.dart';
import 'package:job_studio_profile_ui/routes/routes.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorageHelper.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingManager(),
      initialRoute: SplashScreen.routeName,
      getPages: RoutesClass.routes,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    ),
  );
}
