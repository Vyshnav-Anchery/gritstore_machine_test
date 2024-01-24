import 'package:flutter/material.dart';
import 'package:gritstore_machine_test/controllers/alarm_controller.dart';
import 'package:gritstore_machine_test/controllers/home_controller.dart';
import 'package:gritstore_machine_test/controllers/weather_controller.dart';
import 'package:gritstore_machine_test/core/constants/app_constants.dart';
import 'package:gritstore_machine_test/core/database/alaramdb.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'core/constants/hive_box.dart';
import 'view/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.location.request();

  await Hive.initFlutter();

  Hive.registerAdapter(AlaramdbAdapter());

  await Hive.openBox<Alaramdb>(AppConstants.alaramBoxName);

  alarmBox = Hive.box<Alaramdb>(AppConstants.alaramBoxName);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<HomeController>(
      create: (context) => HomeController(),
    ),
    ChangeNotifierProvider<AlarmController>(
      create: (context) => AlarmController(),
    ),
    ChangeNotifierProvider<WeatherController>(
      create: (context) => WeatherController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Alarm App',
      darkTheme: ThemeData.dark(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const HomePage(),
    );
  }
}
