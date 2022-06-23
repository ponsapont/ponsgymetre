import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ponsgymetre/pages/create_routine.dart';
import 'package:ponsgymetre/pages/home.dart';
import 'firebase_options.dart';

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
        primarySwatch: Colors.indigo,
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
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.black,
            Colors.black,
            Colors.indigo.shade900,
          ])),
      child: child,
    )));
  }
}
