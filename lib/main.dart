import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Routes/AppRoutes.dart';

Future main()async {
 await WidgetsFlutterBinding.ensureInitialized();
 if(kIsWeb){
  await Firebase.initializeApp(
options: FirebaseOptions(
    apiKey: "AIzaSyCY9VVgtA_aKNwBNbDBKDUPmKhmFQeOrZI",
    authDomain: "ojhas-35e7a.firebaseapp.com",
    projectId: "ojhas-35e7a",
    storageBucket: "ojhas-35e7a.firebasestorage.app",
    messagingSenderId: "847777712736",
    appId: "1:847777712736:web:f8d0a3c7ac5fa041ded105",
    measurementId: "G-2BN0088MPK"
)
   );
 }

 await Firebase.initializeApp();
 await GetStorage.init(); // Initialize GetStorage
 runApp( MyApp());
}


class MyApp extends StatelessWidget {

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    String? userEmail = box.read('email');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ojas App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          elevation: 0,
        ),
      ),
      // The initial route is set to the splash screen.
    initialRoute: FirebaseAuth.instance.currentUser == null ? '/' : '/home',
      // GetX uses the routes defined in AppPages.
      getPages: AppPages.routes,
    );
  }
}