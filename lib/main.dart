<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_api_architecture/error_handling/error_handling.dart';
import 'package:food_api_architecture/routes/routes_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';  // ✅ Import Sizer package
=======
import 'package:flutter/material.dart';
import 'package:food_api_architecture/error_handling/error_handling.dart';
import 'package:food_api_architecture/routes/app_page.dart';
import 'package:food_api_architecture/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'localization/app_translations.dart';
>>>>>>> 3906723 (Initial commit with full project)

void main() {

  //main global error handling
<<<<<<< HEAD
  WidgetsFlutterBinding.ensureInitialized();
  ErrorHandler.initGlobalErrorHandler();

=======
  // Ensure that the Flutter engine is initialized before using any Flutter features
  // This is particularly important for error handling and routing.
  // WidgetsFlutterBinding is a singleton that binds the Flutter framework to the engine.
  WidgetsFlutterBinding.ensureInitialized();
  ErrorHandler.initGlobalErrorHandler();

  

>>>>>>> 3906723 (Initial commit with full project)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

<<<<<<< HEAD
=======
  // static const supportedLocales = [
  //   Locale('en','US'),
  //   Locale('hi','IN'),
  // ];

>>>>>>> 3906723 (Initial commit with full project)
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
<<<<<<< HEAD
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.allProductList,
=======

          translations: AppTranslations(),
          locale: const Locale('en', 'US'),            // default language
          fallbackLocale: const Locale('en', 'US'),    // fallback on error
          supportedLocales: [
            Locale('en', 'US'),
            Locale('hi', 'IN'),
          ],

          getPages: AppPages.pages,
          initialRoute: AppRoutes.home,
>>>>>>> 3906723 (Initial commit with full project)
        );
      },
    );
  }
}
