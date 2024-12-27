import 'package:flutter/material.dart';
import 'package:tast_managger/core/services/service_locator.dart';
import 'package:tast_managger/ui/screens/home/screens/home_screen.dart';

import 'config/config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const appConfig = AppConfig(
    apiUrl: 'https://ecsdevapi.nextline.mx/vdev/tasks-challenge/',
  );
  ServiceLocator.setupServiceLocator(appConfig);
  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Task Manager',
        theme: AppTheme(selectedColor: 0).getTheme(),
        debugShowCheckedModeBanner: false,
        home: const Homescreen());
  }
}
