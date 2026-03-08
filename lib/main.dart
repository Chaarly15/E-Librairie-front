import 'package:e_librairie_front/app/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  
  //Charger les widget avant le lancement de l'app
  WidgetsFlutterBinding.ensureInitialized();

  //Eviter l'orientation paysage de l'app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  
  // Charger les varible d'environnement
  await dotenv.load(fileName: Env.isLocal? Env.developpement : Env.production);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
