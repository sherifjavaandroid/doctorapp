import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'language/english.dart';
import 'language/language_controller.dart';
import 'routes/routes.dart';
import 'utils/theme.dart';
        
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Locking Device Orientation
await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); 
                  
  // main app
  runApp(const MyApp());                      
}
      
// This widget is the root of your application.  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: Themes().theme,
        navigatorKey: Get.key,
        initialRoute: Routes.splashScreen,
        getPages: Routes.list,
        initialBinding: BindingsBuilder(
          () {
            Get.put(LanguageController());
          },
        ),
        builder: (context, widget) {
          ScreenUtil.init(context);
          final languageController = Get.find<LanguageController>();
          return Obx(
            () => MediaQuery(
              // ignore: deprecated_member_use
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Directionality(
                textDirection: languageController.isLoading
                    ? TextDirection.ltr
                    : languageController.languageDirection,
                child: widget!,
              ),
            ),
          );
        },
      ),
    );
  }
}
