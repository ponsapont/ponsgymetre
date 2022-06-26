import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ponsgymetre/pages/create_routine.dart';
import 'package:ponsgymetre/pages/home.dart';
import 'firebase_options.dart';

/// Colors to use in the application
class AppColors {
  static Color background = const Color.fromARGB(255, 18, 18, 18);
  static Color cardBackground = const Color.fromARGB(255, 45, 45, 45);
  static Color primary = Colors.blue.shade400;
  static Color secondary = Colors.green.shade400;
  static Color primaryAccent = AppColors.primary.withAlpha(30);
  static MaterialColor materialPrimary = Colors.blue;
  static Color text = Colors.white;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const AppContainer(child: HomePage()),
        '/create_routine': (context) => AppContainer(child: CreateRoutine()),
        '/list': (context) => const AppContainer(child: HomePage()),
        '/history': (context) => const AppContainer(child: HomePage()),
        '/statistics': (context) => const AppContainer(child: HomePage()),
        '/start': (context) => const AppContainer(child: HomePage()),
      },
      // home: const HomePage(),
      title: 'El PonsGymetre',
      theme: ThemeData(
        primarySwatch: AppColors.materialPrimary,
      ),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: child,
    );
  }
}
