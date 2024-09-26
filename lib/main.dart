import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pp_442/features/hobbies/domain/state_management/completed_hobby_cubit.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_cubit.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_time_cubit.dart';

import 'core/services/database_service.dart';
import 'main_app.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  // TODO uncomment while building
  // final configService = await ConfigService().init();
  // WidgetsBinding.instance.addObserver(
  //   AppLifecycleListener(
  //     onDetach: () {
  //       configService.closeClient();
  //       log('Закрытие приложения');
  //     },
  //   ),
  // );

  final databaseService = DatabaseService();
  await databaseService.init();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => databaseService),
        // TODO uncomment while building
        // RepositoryProvider(create: (context) => configService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HobbyTimeCubit(
              box: databaseService.hobbyTimes,
            ),
          ),
          BlocProvider(
            create: (context) => CompletedHobbyCubit(
              box: databaseService.completedHobbies,
            ),
          ),
          BlocProvider(
            create: (context) => HobbyCubit(
              box: databaseService.hobbies,
              completedHobbyCubit: context.read<CompletedHobbyCubit>(),
            ),
          ),
        ],
        child: MainApp(),
      ),
    ),
  );
}
