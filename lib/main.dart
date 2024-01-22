import 'package:flutter/material.dart';
import 'package:daily_recipes2/pages/Loginpage.dart';
import 'package:daily_recipes2/pages/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_recipes2/services/preferences.services.dart';
import 'package:provider/provider.dart';
import 'package:daily_recipes2/provider/Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'firebase_options.dart';
import 'package:daily_recipes2/firebase_options.dart';
import 'package:daily_recipes2/provider/app_auth.provider.dart';
import 'package:daily_recipes2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    var preference = await SharedPreferences.getInstance();

    GetIt.I.registerSingleton<SharedPreferences>(preference);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppAuthProvider()),
    ChangeNotifierProvider(create: (_) => AdsProvider()..loadAdsList()),
  ], child:  MyApp()));

 // runApp( ChangeNotifierProvider(
 //  create: (_) => AdsProvider()..loadAdsList(),
   // child:MyApp(),),);
}
class MyApp extends StatelessWidget {
  // final adsProvider = AdsProvider();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Splashscreen(),
    );
  }
}