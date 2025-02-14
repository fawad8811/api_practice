import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task_fawad/screens/splash_screen.dart';
import 'package:hiring_task_fawad/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_config/responsive_config.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fawad Test Hiring Task',
      home: SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'poppins',
        splashColor: Colors.transparent,
        useMaterial3: true,
      ),
    );
  }
}
