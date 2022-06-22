import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
      title: 'El PonsGymetre',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'PonsGymetre'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
          child: GridView.count(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.indigo[100],
            child: InkWell(
              onTap: () => {},
              splashColor: Colors.blue.withAlpha(30),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.fitness_center, size: 50),
                      Text(
                        'New Routine',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.indigo[100],
            child: InkWell(
              onTap: () => {},
              splashColor: Colors.blue.withAlpha(30),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.list, size: 50),
                      Text(
                        'List Routines',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.indigo[100],
            child: InkWell(
              onTap: () => {},
              splashColor: Colors.blue.withAlpha(30),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.history, size: 50),
                      Text(
                        'History',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.indigo[100],
            child: InkWell(
              onTap: () => {},
              splashColor: Colors.blue.withAlpha(30),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.auto_graph, size: 50),
                      Text(
                        'Statistics',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.indigo[100],
            child: InkWell(
              onTap: () => {},
              splashColor: Colors.blue.withAlpha(30),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.flash_on, size: 50),
                      Text(
                        'Start Workout',
                        style: TextStyle(fontSize: 25),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
