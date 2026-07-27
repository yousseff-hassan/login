import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fad/features/login/presentation/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'FAD Qualification',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
            fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home: const LoginView(),
          routes: {
            '/signup': (context) => Scaffold(
                  appBar: AppBar(title: const Text('Sign Up')),
                  body: const Center(child: Text('Sign Up Screen')),
                ),
            '/forgetPassword': (context) => Scaffold(
                  appBar: AppBar(title: const Text('Forgot Password')),
                  body: const Center(child: Text('Forgot Password Screen')),
                ),
          },
        );
      },
    );
  }
}
