import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hourse_lux/view/accounts/splash_screen.dart';
import 'utils/themes.dart';

late GetStorage box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  box = GetStorage();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static const double _designWidth = 430;
  static const double _desigHeight = 930;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(MyApp._designWidth, MyApp._desigHeight),
        builder: (context, widget) {
          return GetMaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }
    );
  }
}
