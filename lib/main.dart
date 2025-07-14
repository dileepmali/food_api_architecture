import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_api_architecture/error_handling/error_handling.dart';
import 'package:food_api_architecture/routes/routes_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';  // ✅ Import Sizer package

void main() {

  //main global error handling
  WidgetsFlutterBinding.ensureInitialized();
  ErrorHandler.initGlobalErrorHandler();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.allProductList,
        );
      },
    );
  }
}
