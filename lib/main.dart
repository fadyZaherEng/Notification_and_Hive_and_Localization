// ignore_for_file: avoid_print
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gss/src/config/themes/light_theme.dart';
import 'package:gss/src/core/resources/bloc_observer/observer.dart';
import 'package:gss/src/core/resources/firebase_options.dart';
import 'package:gss/src/data/sources/local/cashe_helper.dart';
import 'package:gss/src/data/sources/remote/gbu/notification/local_notification.dart';
import 'package:gss/src/di/injector.dart';
import 'package:gss/src/domain/entities/responses/home_response/home_tower.dart';
import 'package:gss/src/presentation/blocs/home/home_bloc.dart';
import 'package:gss/src/presentation/blocs/internet/internet_bloc.dart';
import 'package:gss/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/src/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:gss/src/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gss/src/presentation/blocs/theme/theme_bloc.dart';
import 'package:gss/src/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModules();
  await initHive();
  await callFirebaseMassaging();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

Future<void> firebaseMassageBackground(RemoteMessage message) async {
  LocalNotificationService.display(message);
}

Future<void> callFirebaseMassaging() async {
  var token = await FirebaseMessaging.instance.getToken();
  print("token:$token \n");
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    LocalNotificationService.display(message);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMassageBackground);
  FirebaseMessaging.onMessage.listen((message) {
    LocalNotificationService.display(message);
  });
  if (SharedHelper.get(key: 'lang') == null) {
    SharedHelper.save(value: 'arabic', key: 'lang');
  }
}

Future<void> initHive() async {
  final Directory dir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TowerModelAdapter());
  if (!Hive.isBoxOpen('towers')) {
    await Hive.openBox<TowerModel>('towers');
  }
}

Future<void> initModules() async {
  await SharedHelper.init();
  await injectionApp();
  await LocalNotificationService.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
//theme locale and others need material app put in one bloc
//then material listner on it
//this bloc is the bloc that happen change in theme, local,elc
//this main that it is main bloc or home bloc

class _MyAppState extends State<MyApp> {
  Locale locale = const Locale("en");
  ThemeData themeData = lightTheme();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => instance<HomeBloc>()),
        BlocProvider(create: (context) => instance<SignUpBloc>()),
        BlocProvider(create: (context) => instance<SignInBloc>()),
        BlocProvider(create: (context) => instance<InternetBloc>()),
        BlocProvider(create: (context) => instance<ThemeBloc>()),
      ],
      child: BlocConsumer<SignInBloc, AbstractionSignInState>(
        listener: (context, state) {
          if (state is SignInChangeLangState) {
            locale = state.locale;
          }
          //here get theme data
          // if (state is LoadThemeState) {
          //   themeData=state.themeData;
          // }
        },
        builder: (context, state) {
          return Phoenix(
            child: Sizer(builder: (ctx, orentation, deviceType) {
              return MaterialApp(
                //flutter gen-l10n
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,
                home: const SignInScreen(),
                debugShowCheckedModeBanner: false,
                theme: themeData,
              );
            }),
          );
        },
      ),
    );
  }
}
