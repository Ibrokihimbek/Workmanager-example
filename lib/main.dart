import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:workmanager/workmanager.dart';
import 'package:workmanager_example/bloc/add_lat_long_bloc/add_lat_long_bloc.dart';
import 'package:workmanager_example/cubit/get_lat_long_qubit/get_lat_long_cubit.dart';
import 'package:workmanager_example/data/repositories/lat_long_repository.dart';
import 'package:workmanager_example/screens/splash/splash_page.dart';

void callbackDispatcher() {
  Workmanager().executeTask(
    (task, inputData) async {
      int? totalExecutions;

      try {} catch (err) {
        Logger().e(
          err.toString(),
        ); // Logger flutter package, prints error on the debug console
        throw Exception(err);
      }
      return Future.value(true);
    },
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  Workmanager().registerOneOffTask("task-identifier", "simpleTask");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CachedLatLongBloc(CachedLatLongRepository()),
        ),
        BlocProvider(
          create: (context) =>
              GetLatLongCubit(latLongRepository: CachedLatLongRepository())
                ..fetchAllContacts(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage());
  }
}
