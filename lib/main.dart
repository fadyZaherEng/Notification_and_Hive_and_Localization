// ignore_for_file: avoid_print
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gss/domain/models/local_notification.dart';
import 'package:gss/utils/show_toast.dart';
import 'utils/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:gss/app/app.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> firebaseMassageBackground(RemoteMessage message) async {
  // print('onMassageFirebaseMassageBackground ${message.data.toString()}');
  // showToast(message: 'onMassageFirebaseMassageBackground', state: ToastState.SUCCESS);
  LocalNotificationService.display(message);
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 // await initAppModule();
  await LocalNotificationService.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Directory dir =await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TowerModelAdapter());
  if(!Hive.isBoxOpen('towers')) {
    await Hive.openBox<TowerModel>('towers');
  }
  var token =await FirebaseMessaging.instance.getToken();
   print("token:$token \n");
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    // print('onMessageOpenedApp ${event.data.toString()}');
    // showToast(message: 'onMessageOpenedApp', state: ToastState.SUCCESS);
    LocalNotificationService.display(message);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMassageBackground);
  FirebaseMessaging.onMessage.listen((message) {
    LocalNotificationService.display(message);
  });
  runApp(const MyApp());
}
