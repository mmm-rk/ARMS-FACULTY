import 'package:arms/Screens/home_page.dart';
import 'package:arms/Screens/welcome_page.dart';
import 'package:arms/controllers/questionController.dart';
import 'package:arms/controllers/studentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart'; // Import path_provider package

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure all plugins are initialized'
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final token = box.read('token');

    // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in, unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          // Use GetMaterialApp for GetX navigation
          debugShowCheckedModeBanner: false,
          title: 'Accountancy Review Management System',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: token == null ? const WelcomePage() : const HomePage(),
        );
      },
    );
  }
}
