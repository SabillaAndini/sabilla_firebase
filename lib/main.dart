import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sabilla_firebase/app/modules/login/controllers/login_controller.dart';
import 'package:sabilla_firebase/app/utils/loading.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyDOEYF8B8GDBs3CguFzjuz4WA2S_EFDSAo',
        authDomain: "sabilla-firebase.firebaseapp.com",
        appId: '1:712012499178:android:e162ef65bb21ea7eda6f93',
        messagingSenderId: '712012499178',
        storageBucket: "sabilla-firebase.appspot.com",
        projectId: 'sabilla-firebase'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
            getPages: AppPages.routes,
            // home: snapshot.data != null ? const HomeView() : LoginView(),
          );
        }
        return const LoadingView();
      },
    );
  }
}
