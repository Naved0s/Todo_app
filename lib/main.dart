import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Data/tasklist.dart';
import 'package:todo/Model/Task.dart';
import 'package:todo/Screens/homeScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Screens/splashScreen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => tasklistClass())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(), //HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
